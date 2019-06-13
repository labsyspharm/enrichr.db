library(rvest)
library(xml2)
library(tidyverse)
library(jsonlite)
library(genebabel)

# Manually downloaded from http://amp.pharm.mssm.edu/Enrichr/#stats
# because can't find deep link without JS
page <- xml2::read_html(file.path("data-raw", "enrichr_table.txt"))

links <- rvest::html_nodes(page, xpath = "//tr/td[last()]/a") %>%
  rvest::html_attr("href")

tab <- rvest::html_table(rvest::html_node(page, "table"))[, -5] %>%
  as_tibble() %>%
  mutate(link = paste0("http://amp.pharm.mssm.edu", links) %>% str_replace("mode=text", "mode=json")) %>%
  arrange(`Gene-set Library`) %>%
  tidyr::extract(
    `Gene-set Library`, c("library", "year"),
    "(.*)_([0-9]{4}[a-z]?$)", remove = FALSE, convert = TRUE
  ) %>%
  # Only keep latest database
  mutate(library = ifelse(is.na(library), `Gene-set Library`, library)) %>%
  group_by(library) %>%
  arrange(desc(year), .by_group = TRUE) %>%
  slice(1) %>%
  ungroup() %>%
  mutate(
    file = map_chr(link, ~tempfile())
  )

download_res <-  split(tab, (seq(nrow(tab)) - 1) %/% 5) %>%
  map(
    ~safely(download.file)(
      .x$link,
      .x$file,
      method = "libcurl",
      mode = "wb"
    )
  )
if(!all(map_int(download_res, "result") == 0)) {
  stop("Not all downloads successfull")
}

files <- tab %>%
  mutate(
    raw = map(file, read_file),
    list = map(raw, fromJSON)
  )
write_rds(files, "enrichr_raw.rds")
files <- read_rds("enrichr_raw.rds")

enrichr_terms <- files %>%
  mutate(
    data = map(
      list,
      # ~enframe(.x[[1]]$terms, "term", "value") %>%
      #   mutate(targets = map(value, ~enframe(.x, "target", "inclusion")))
      function(l) {
        l[[1]][["terms"]] %>%
          map(
            ~names(.x) %>%
              genebabel::query_hgnc(match_cols = c("symbol", "prev_symbol", "alias_symbol")) %>%
              drop_na(symbol) %>%
              pull(symbol)
          )
      }
    ),
    meta = map(
      list,
      function(l) {
        as_tibble(l[[1]][-length(l[[1]])])
      }
    )
  ) %>%
  select(
    library = `Gene-set Library`, year, n_terms = Terms, gene_coverage = `Gene Coverage`,
    n_genes_per_term = `Genes per Term`, data, meta
  ) %>%
  unnest(meta) %>%
  select(1:5, category, description = format, data)

usethis::use_data(enrichr_terms, compress = "gzip", overwrite = TRUE)
