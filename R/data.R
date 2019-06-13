#' Enrichr gene sets
#'
#' A dataset containing all gene sets from the Enrichr database including
#' metadata.
#'
#' Where multiple versions are available, only the most recent release
#' is included.
#'
#' All gene symbols in the gene lists where updated to the HGNC canonical symbols
#' as of 2019-06-01.
#'
#' Please acknowledge Enrichr in your publications by citing the following references:
#'
#' \cite{Chen EY, Tan CM, Kou Y, Duan Q, Wang Z, Meirelles GV, Clark NR, Ma'ayan A. Enrichr: interactive and collaborative HTML5 gene list enrichment analysis tool. BMC Bioinformatics. 2013;128(14)}
#'
#' \cite{Kuleshov MV, Jones MR, Rouillard AD, Fernandez NF, Duan Q, Wang Z, Koplev S, Jenkins SL, Jagodnik KM, Lachmann A, McDermott MG, Monteiro CD, Gundersen GW, Ma'ayan A. Enrichr: a comprehensive gene set enrichment analysis web server 2016 update. Nucleic Acids Research. 2016; gkw377}
#'
#' @format A tibble with 123 rows and 10 columns
#' \describe{
#'   \item{library}{the library or source the gene sets where derived from}
#'   \item{year}{release year of the library}
#'   \item{n_terms}{number of terms (gene sets)}
#'   \item{gene_coverage}{number of unique genes across all terms}
#'   \item{n_genes_per_term}{average number of genes per term}
#'   \item{category}{broad category for the gene set library}
#'   \item{description}{description of the membership in the gene set}
#'   \item{data}{list column containing the symbols for each term}
#' }
#'
#' @source \url{http://amp.pharm.mssm.edu/Enrichr/}
"enrichr_terms"
