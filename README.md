# enrichr.db

The goal of enrichr.db is to provide the data from [Enrichr](http://amp.pharm.mssm.edu/Enrichr/) in
a format that makes it easy to access the gene sets programmatically from R.

## Installation

You can install the released version of enrichr.db from [Github](https://github.com/clemenshug/enrichr.db) with:

``` r
remotes::install_github("clemenshug/enrichr.db")
```

## Example

This is a basic example which shows you how to query the gene set database:

``` r
library(tidyverse)
library(enrichr.db)

drug_gene_sets <- enrichr_terms %>%
  filter(grepl("drug", library, ignore.case = TRUE))

# Finding all libraries that have something to do with drug treatments
print(drug_gene_sets, width = Inf, n = Inf)
```

    ## # A tibble: 5 x 8
    ##   library                                           year  n_terms
    ##   <chr>                                             <chr>   <int>
    ## 1 Drug_Perturbations_from_GEO_2014                  2014      701
    ## 2 Drug_Perturbations_from_GEO_down                  <NA>      906
    ## 3 Drug_Perturbations_from_GEO_up                    <NA>      906
    ## 4 DrugMatrix                                        <NA>     7876
    ## 5 RNA-Seq_Disease_Gene_and_Drug_Signatures_from_GEO <NA>     1302
    ##   gene_coverage n_genes_per_term category      
    ##           <int>            <dbl> <chr>         
    ## 1         47107              509 Legacy        
    ## 2         23877              302 Crowd         
    ## 3         24350              299 Crowd         
    ## 4          5209              300 Diseases/Drugs
    ## 5         22440              505 Crowd         
    ##   description                                                         
    ##   <chr>                                                               
    ## 1 {1} is differentially expressed when the cell is perturbed with {0}.
    ## 2 {0} is downregulated by {1}.                                        
    ## 3 {0} is upregulated by {1}.                                          
    ## 4 "{0} is differentially expressed in sample {1} "                    
    ## 5 {0} is differentially expressed in {1}.                             
    ##   data          
    ##   <list>        
    ## 1 <list [701]>  
    ## 2 <list [906]>  
    ## 3 <list [906]>  
    ## 4 <list [7,876]>
    ## 5 <list [1,302]>

``` r
# Printing the first 5 gene sets of the first library we found (Drug_Perturbations_from_GEO_2014)
print(head(drug_gene_sets$data[[1]], n = 5))
```

    ## $`estradiol_mus musculus_gpl339_gse16854_chdir_down`
    ##  [1] "FZD2"    "ANXA2"   "ELOVL5"  "TPI1"    "RPS6"    "MIF"     "HSPA4"  
    ##  [8] "CYP7B1"  "RPSA"    "TGFBR2"  "GDF10"   "PKM"     "COL6A1"  "OGN"    
    ## [15] "PALLD"   "GM5506"  "COL5A1"  "COL6A3"  "COL6A2"  "SPRR1A"  "ALDOA"  
    ## [22] "GAPDH"   "FBN1"    "LXN"     "LPL"     "RPL13"   "RPL12"   "RASL11B"
    ## [29] "IQGAP1"  "HTRA1"   "PLOD2"   "THBS2"   "BC1"     "LDHA"    "GJA1"   
    ## [36] "FAM162A" "PGK1"    "BNIP3"   "RPL36"   "QSOX1"   "ENPP2"   "TMED2"  
    ## [43] "RPS10"  
    ## 
    ## $`letrozole_homo sapiens_gpl3921_gse33366_chdir_down`
    ##   [1] "CKMT1A"        "MX2"           "PSMB9"         "SCAMP4"       
    ##   [5] "SCD"           "PBEF1"         "OPTN"          "CYFIP2"       
    ##   [9] "GPATCH2"       "ASAH1"         "LASS6"         "SPDEF"        
    ##  [13] "APOL6"         "CREB3L1"       "MUC1"          "KIAA1324"     
    ##  [17] "HNRPA1P5"      "D15WSU75E"     "PRSS8"         "RABAC1"       
    ##  [21] "HES1"          "GABARAPL3"     "NEBL"          "PLK2"         
    ##  [25] "PARD3"         "PHKA1"         "PBX1"          "AR"           
    ##  [29] "PPFIBP2"       "BCAM"          "LOC100510451"  "FASN"         
    ##  [33] "PSME4"         "VAMP5"         "HLA-DRB1"      "CFB"          
    ##  [37] "LXN"           "RPL31"         "NEDD4L"        "LOC100506190" 
    ##  [41] "TAPBPL"        "ZNF24"         "MYLK"          "ALCAM"        
    ##  [45] "KIAA1467"      "NKX3-1"        "KIAA0319L"     "IER3"         
    ##  [49] "CYB5R1"        "GSTM4"         "DUSP4"         "JUN"          
    ##  [53] "DUSP1"         "EMP1"          "DKFZP564O0823" "GP2"          
    ##  [57] "WDR32"         "GPRC5A"        "KAT2B"         "FXYD3"        
    ##  [61] "PIGB"          "PXMP4"         "PLEKHM1"       "RAPGEF6"      
    ##  [65] "HIST2H2AA4"    "SEL1L"         "ADM"           "LITAF"        
    ##  [69] "MYO6"          "TIMP3"         "MIOS"          "ZNF467"       
    ##  [73] "STAT1"         "SERPINB1"      "TPK1"          "TMEM62"       
    ##  [77] "SLC2A10"       "RNASE4"        "FMO5"          "GNMT"         
    ##  [81] "DHRS3"         "TCAG7.1314"    "OAF"           "PLCB4"        
    ##  [85] "MCF2L-AS1"     "TMEM140"       "ING1"          "IFIH1"        
    ##  [89] "TP53TG1"       "ARFRP1"        "HEY1"          "ENSA"         
    ##  [93] "BIK"           "YIPF1"         "TFPI2"         "ZBTB10"       
    ##  [97] "GOLM1"         "TAP1"          "HIPK2"         "TCTA"         
    ## [101] "CRAT"          "ZNF552"        "FAM59A"        "VTCN1"        
    ## [105] "FAM129A"       "CLU"           "C1ORF115"      "FOXO1"        
    ## [109] "SLC9A2"        "KIAA0513"      "RAB26"         "SH3BP4"       
    ## [113] "RPRM"          "CERS4"         "TMEM132A"      "IGFBP5"       
    ## [117] "B3GALT4"       "METRN"         "NBEA"          "MTL5"         
    ## [121] "MAFF"          "MED23"         "REEP1"         "BCL2L1"       
    ## [125] "TPP1"          "XAF1"          "SLC26A2"       "CPB1"         
    ## [129] "KCNE4"         "ATP8A1"        "CLSTN1"        "SAT1"         
    ## [133] "IPO7"          "CORO1B"        "RHOBTB2"       "OSBPL10"      
    ## [137] "IL13RA1"       "ZKSCAN1"       "PTPN18"        "HMGCS2"       
    ## [141] "WIPI1"         "HIG2"          "PTPN13"        "SORD"         
    ## [145] "DHCR24"        "C18ORF1"       "PION"          "BCL6"         
    ## [149] "BCL3"          "SOS2"          "MIPEP"         "CPQ"          
    ## [153] "PLEKHF2"       "SNAP23"        "C3ORF52"       "NDUFB2"       
    ## [157] "PP14571"       "TARP"          "RAP1GAP"       "DUSP10"       
    ## [161] "DRAM1"         "P2RY6"         "MB"            "PHACTR2"      
    ## [165] "BCAS1"         "LIMCH1"        "UGT2B17"       "SPAG4"        
    ## [169] "MBOAT2"        "SELENBP1"      "ATXN10"        "MYO1B"        
    ## [173] "PPAP2C"        "ANG"           "LOC400451"     "TRIM34"       
    ## [177] "SLC24A3"       "CANT1"         "PSCA"          "SYCP2"        
    ## [181] "UGT2B28"       "LOC100287275"  "HSD17B11"      "ARRB1"        
    ## [185] "CCL5"          "PGM3"          "ITGAV"         "MSMB"         
    ## [189] "IL1R1"         "SP110"         "ECH1"          "RSAD2"        
    ## [193] "SLC12A2"       "KRT7"          "SEPP1"         "TM4SF1"       
    ## [197] "PML"           "AZGP1"         "MAPK10"        "RRAGD"        
    ## [201] "PPP1R3C"       "TRIM14"        "HIST1H4H"      "SERHL2"       
    ## [205] "RIN2"          "HIST1H4D"      "EPAS1"         "IFITM2"       
    ## [209] "CERK"          "SP100"         "IFITM1"        "PLEKHB1"      
    ## [213] "CALML5"        "AQP3"          "MGC39372"      "UBE2L6"       
    ## [217] "C4A"           "ARNTL"         "HERC6"         "C4B"          
    ## [221] "FRAT1"         "APBB2"         "SLC12A7"       "SLC35C1"      
    ## [225] "ST6GAL1"       "GOLSYN"        "PLA2G4C"       "EAF2"         
    ## [229] "HLA-C"         "RAB27B"        "HLA-A"         "HLA-B"        
    ## [233] "HLA-G"         "IFI44"         "HLA-E"         "PARP12"       
    ## [237] "GOLGB1"        "SDC1"          "CD302"         "GRB7"         
    ## [241] "MAGED2"        "IFI35"         "PALM2-AKAP2"   "IFIT2"        
    ## [245] "IFIT1"         "IFIT3"         "SOX2"          "FTH1"         
    ## [249] "ATP6V0A4"      "TSPAN3"        "TNFSF10"       "FFAR2"        
    ## [253] "TSPAN1"        "LGALS8"        "EDN1"          "NCOA1"        
    ## [257] "NMI"           "KLK11"         "KLK13"         "VAV3"         
    ## [261] "BST2"          "CEACAM7"       "CEACAM6"       "CEACAM5"      
    ## [265] "KRT15"         "CCNG2"         "CRELD1"        "DDR1"         
    ## [269] "TRAM2"         "MAOA"          "TMPRSS2"       "STC2"         
    ## [273] "CROT"          "PPP3CA"        "SH3BGRL"       "SOCS2"        
    ## [277] "TP53AP1"       "DND1"          "NEU1"          "RRAS"         
    ## [281] "SMYD3"         "ARNT2"         "NQO1"          "TPD52"        
    ## [285] "ATP6V0E2"      "RFTN1"         "MCCC2"         "LIMA1"        
    ## [289] "NUDT9"         "C9ORF7"        "KIAA0500"      "LY6G5C"       
    ## [293] "OR7E14P"       "NUPL2"         "CSTA"          "MIA3"         
    ## [297] "CXCR7"         "ICA1"          "TRAK1"         "NUDT4"        
    ## [301] "HERPUD1"       "CAMK2N1"       "CXCR4"         "ENC1"         
    ## [305] "TIAF1"         "KIF13B"        "CD55"          "TFAP2B"       
    ## [309] "GDF15"         "RARRES3"       "HRASLS2"       "LMO3"         
    ## [313] "KLHL24"        "ATP1B1"        "ALDH4A1"       "TMEM135"      
    ## [317] "IFI44L"        "BAMBI"         "PMP22"         "ABCG1"        
    ## [321] "LRP10"         "ULBP2"         "MPHOSPH6"      "STEAP1"       
    ## [325] "TFAP2A"        "NOL3"          "IFI6"          "NDRG1"        
    ## [329] "GALNT10"       "ZFP36L2"       "CLGN"          "RXRA"         
    ## [333] "SASH1"         "REPS2"         "CADPS2"        "CAST"         
    ## [337] "MANBA"         "DDX58"         "SMAD1"         "EPHX2"        
    ## [341] "ARID5B"        "INHBB"         "ESR1"          "KMO"          
    ## [345] "ACSF2"         "FGF13"         "MXD4"          "FGFR2"        
    ## [349] "ERO1LB"        "PXK"           "WWC3"          "SEZ6L2"       
    ## [353] "DDX60"         "TRGC2"         "ZMAT4"         "FAM174B"      
    ## [357] "FLOT1"         "MOSC2"         "MFAP3L"        "ABCC4"        
    ## [361] "GALNT7"        "ABCC3"         "TTC12"         "OAS1"         
    ## [365] "NFKBIA"        "BMP4"          "ELF3"          "RABEP2"       
    ## [369] "OAS2"          "ACOX3"         "DNASE1"        "ELF5"         
    ## [373] "OAS3"          "LOC137886"     "IRF9"          "FBP1"         
    ## [377] "SHANK2"        "PIK3R3"        "GHR"           "FUT9"         
    ## [381] "ERBB4"         "CA5B"          "ERBB2"         "BDKRB2"       
    ## [385] "CXADR"         "TMEM30A"       "PDE4D"         "TBC1D9"       
    ## [389] "PLA2G16"       "TBC1D1"        "C19ORF66"      "AIM1"         
    ## [393] "DDIT4"         "S100P"         "SPRY1"         "TMEM41B"      
    ## [397] "MVP"           "ATP2A3"        "USP18"         "OASL"         
    ## [401] "SH3YL1"        "SGSH"          "CLMN"          "EPS8L1"       
    ## 
    ## $`mifepristone_homo sapiens_gpl6947_gse39654_chdir_down`
    ##   [1] "ACSL3"      "RPL21"      "ACSL1"      "RPL23"      "CKMT1A"    
    ##   [6] "CNBP"       "DEK"        "HSPE1"      "RPL13AP20"  "SCD"       
    ##  [11] "CDAN1"      "HIST1H4C"   "MTHFD2"     "PPA2"       "C19ORF48"  
    ##  [16] "RPL26"      "GAGE6"      "SUCLG2"     "GAGE5"      "CALM2"     
    ##  [21] "ACOT7"      "PFN1"       "VPS29"      "MTPN"       "ITIH5"     
    ##  [26] "RPL11"      "RPL10"      "DCAF6"      "GABPB2"     "FAM120A"   
    ##  [31] "RPL36AL"    "ZMIZ1"      "MYC"        "RPL19"      "B2M"       
    ##  [36] "RPL18"      "EXOSC3"     "FDFT1"      "CMC2"       "MIF"       
    ##  [41] "MANF"       "COMMD3"     "SLC16A12"   "RPS27"      "RPS29"     
    ##  [46] "RPS28"      "ADCK3"      "SIVA1"      "RPS23"      "FARSB"     
    ##  [51] "RPS25"      "RPS24"      "LYPLAL1"    "RPL5"       "SLC45A3"   
    ##  [56] "RPL3"       "RPL31"      "RPL32"      "TFRC"       "RPL35"     
    ##  [61] "ECI2"       "TXN"        "PCBP1"      "CCT6P1"     "C14ORF166" 
    ##  [66] "ENO1"       "RPL9"       "SMC4"       "TXNDC17"    "RPL7"      
    ##  [71] "RPL8"       "RPS16"      "CYB5R3"     "RPS18"      "PRDX6"     
    ##  [76] "RPS17"      "PRDX2"      "NKX3-1"     "RPL39"      "RPS10"     
    ##  [81] "RPS12"      "RPS11"      "RPS14"      "LRRC26"     "PNPT1"     
    ##  [86] "PTGES3"     "TUBB"       "SSR4"       "TCP1"       "AKR1A1"    
    ##  [91] "LILRB3"     "IL18"       "MRPL24"     "RHOC"       "GLUD1"     
    ##  [96] "TMEFF2"     "PTPRF"      "CCNG1"      "CENPN"      "TMEM106C"  
    ## [101] "PABPC1"     "COX7B"      "BTG1"       "ARF1"       "TMPRSS2"   
    ## [106] "PEA15"      "KLK4"       "SLC35F2"    "OAZ1"       "ECHS1"     
    ## [111] "MRPL36"     "TRMT112"    "GJC1"       "STK39"      "SEC61B"    
    ## [116] "RPL23AP64"  "PNPO"       "RPS15A"     "CCR6"       "RPS27A"    
    ## [121] "NPM1"       "CCT3"       "DYNLL1"     "VKORC1"     "ATP6V0E2"  
    ## [126] "ELOVL5"     "MRPS26"     "PARP1"      "RPA2"       "THOC7"     
    ## [131] "PSMA6"      "DDB1"       "MRPL51"     "PSMA4"      "HNRNPA2B1" 
    ## [136] "ADAM15"     "NDUFAB1"    "PGAM4"      "CKS2"       "FH"        
    ## [141] "LAD1"       "GDI2"       "RPLP2"      "RPLP1"      "NUCKS1"    
    ## [146] "TUBA1A"     "UNG"        "TMEM141"    "CENPB"      "XPO1"      
    ## [151] "SPTLC1"     "TUBA1B"     "RPL18A"     "PSMB3"      "PSMB1"     
    ## [156] "CKB"        "TSPO"       "NUSAP1"     "TMEM14B"    "LAIR1"     
    ## [161] "SNRPN"      "C21ORF33"   "UBE2C"      "RPS6"       "AMY1C"     
    ## [166] "ATP1B3"     "HNRNPAB"    "RBX1"       "TUBA4A"     "C1ORF116"  
    ## [171] "CSDA"       "MSH3"       "PTTG3P"     "PRR15L"     "SNRPF"     
    ## [176] "CDKN2AIPNL" "RPL13AP6"   "FKBP5"      "CNIH4"      "C8ORF33"   
    ## [181] "DEGS1"      "UBE2M"      "SNRPB"      "STEAP1"     "PCNA"      
    ## [186] "ZNF430"     "ROCK2"      "AKR1D1"     "NDUFB11"    "ZWILCH"    
    ## [191] "PDCD7"      "NDUFB10"    "CIB1"       "DNAJC28"    "GGA1"      
    ## [196] "HSP90B1"    "CNDP2"      "NOL7"       "ATP5J2"     "CFL1"      
    ## [201] "RPS5"       "RPS2"       "HMGN2"      "ATP6V0B"    "F2R"       
    ## [206] "DSTN"       "ARPC5"      "EEF2"       "CREB1"      "UQCRBP1"   
    ## [211] "NCL"        "SRPRB"      "EIF4G2"     "INSIG1"     "HIGD1A"    
    ## [216] "OSBP"       "MPC2"       "PMEPA1"     "FAM162A"    "NARS"      
    ## [221] "PPIAL4A"    "CYC1"       "ABCC4"      "TMED10P1"   "HSP90AA1"  
    ## [226] "TNFRSF19"   "HSPA8"      "SHROOM3"    "RPS3A"      "SORD"      
    ## [231] "TUBA3FP"    "CYB5A"      "DBNDD1"     "NDUFS8"     "CHPT1"     
    ## [236] "RPL37A"     "CDK4"       "NDUFS5"     "RPS26P11"   "CDK1"      
    ## [241] "MCM7"       "ZNF511"     "YWHAG"      "NAA20"      "PSMD12"    
    ## [246] "AMD1"       "LAMC1"      "HMGB2"      "DBI"        "ORC6"      
    ## [251] "HEBP2"      "PAGR1"      "ATP5B"      "SEP15"      "ATP5H"     
    ## [256] "RDH11"      "PDE4C"      "NAE1"       "LOC729603"  "C8ORF59"   
    ## [261] "LIMCH1"     "KCNH6"      "H2AFZ"      "RRM1"       "DCXR"      
    ## [266] "RPL35A"     "RPL23A"     "SHCBP1"     "SOD1"       "UQCRHL"    
    ## [271] "KPNB1"      "PPAP2A"     "EIF3K"      "SSBP1"      "MATR3"     
    ## [276] "SLC25A10"   "PFDN5"      "CLUAP1"     "GAPDH"      "AURKAIP1"  
    ## [281] "NOP56"      "EIF4A1"     "HSP90AB1"   "YBX1"       "RPL10A"    
    ## [286] "KIAA0101"   "HSPD1"      "RN7SL1"     "PTPLB"      "RPS4X"     
    ## [291] "ADAMTS1"    "SUMO2"      "TRA2B"      "UBQLN2"     "LRIG1"     
    ## [296] "POLR2H"     "BUB3"       "CHCHD2"    
    ## 
    ## $`tamoxifen_homo sapiens_gpl96_gds2367_chdir_down`
    ##   [1] "UBE2C"       "HUWE1"       "HN1"         "HNRNPAB"     "RPSA"       
    ##   [6] "C20ORF24"    "CDC20"       "RAB31"       "PPIA"        "SCD"        
    ##  [11] "HNRNPK"      "UBE2S"       "MTHFD2"      "CD9"         "UQCRQ"      
    ##  [16] "RPL13AP5"    "FAU"         "SRSF3"       "PPIF"        "CALM2"      
    ##  [21] "MXRA5"       "FKBP4"       "SNRPB"       "RAN"         "221798_X_AT"
    ##  [26] "PCNA"        "CCNI"        "SRSF2"       "UQCR10"      "AURKA"      
    ##  [31] "TYMS"        "HSP90B1"     "TOB1"        "ATP5J2"      "FAM120A"    
    ##  [36] "ACTB"        "LAPTM4B"     "ZNF706"      "PTTG1"       "PERP"       
    ##  [41] "TPM1"        "CFL1"        "SLC39A6"     "RPS2"        "W26593"     
    ##  [46] "HMGN2"       "KPNA2"       "COX8A"       "RPL41"       "XBP1"       
    ##  [51] "XRCC6"       "IGFBP4"      "TBCA"        "SLC9A3R1"    "EIF1"       
    ##  [56] "CKAP4"       "RPS27"       "PTP4A2"      "RPS26"       "RPS29"      
    ##  [61] "H1F0"        "JTB"         "CSNK2B"      "SDC2"        "RPS21"      
    ##  [66] "RPS20"       "ERH"         "ATF4"        "CERS2"       "SET"        
    ##  [71] "ANP32B"      "ARL6IP1"     "TFRC"        "ACTG1"       "ARL3"       
    ##  [76] "RPS17L"      "RPS16"       "CCNB1"       "EBP"         "UBC"        
    ##  [81] "PCBP2"       "RPL38"       "IER3"        "HSP90AA1"    "PTGES3"     
    ##  [86] "TUBB"        "SSR4"        "H3F3B"       "TRMT5"       "EMP2"       
    ##  [91] "ZWINT"       "ELF1"        "PTMA"        "CDK1"        "TMEM106C"   
    ##  [96] "TFF1"        "GARS"        "TMBIM6"      "MCM7"        "MIR1244-2"  
    ## [101] "TOMM6"       "CDKN3"       "COX7C"       "SHMT2"       "TOP2A"      
    ## [106] "ARPC1B"      "ATP5L"       "CLTC"        "CKS1B"       "HMGB1"      
    ## [111] "OAZ1"        "TMEM164"     "ATP5O"       "HSPB1"       "HINT1"      
    ## [116] "LASP1"       "IRAK1"       "UQCRFS1"     "RPS27A"      "MARCKSL1"   
    ## [121] "RRM2"        "H2AFZ"       "PGAM1"       "RRM1"        "H2AFX"      
    ## [126] "TPBG"        "RPL23A"      "TAF10"       "PRC1"        "YWHAZ"      
    ## [131] "TUBB4B"      "PGRMC1"      "COX6B1"      "TPD52L1"     "PKM"        
    ## [136] "DNAJA1"      "CANX"        "CKS2"        "VDAC2"       "HDGF"       
    ## [141] "SLC25A5"     "GAPDH"       "CD63"        "MEA1"        "SEMA3C"     
    ## [146] "YBX1"        "KIAA0101"    "NUCKS1"      "TSPAN13"     "ATP5G3"     
    ## [151] "HSPD1"       "ADD3"        "AGR2"        "BUB3"        "CHCHD2"     
    ## [156] "NOMO3"      
    ## 
    ## $`fluorouracil_homo sapiens_gpl550_zr-75-1_gds1627_chdir_up`
    ##  [1] "DUSP4"    "NME3"     "AKR1A1"   "TUBB2A"   "AKR7A2"   "PPP1CB"  
    ##  [7] "MRPL23"   "TMEM258"  "TMCO6"    "KRT19"    "SNRPG"    "6617"    
    ## [13] "POLR3K"   "PFN1"     "SNORA64"  "RAN"      "RNF2"     "RPN1"    
    ## [19] "13120"    "TOP2A"    "AK024164" "HMGB1"    "3478"     "EXOSC4"  
    ## [25] "HMGN1"    "YWHAH"    "19512"    "TIMM8B"   "DENND2D"  "TOE1"    
    ## [31] "H2AFZ"    "MDH2"     "Z36789"   "H2AFX"    "DNAJC17"  "EIF2S1"  
    ## [37] "MYL12A"   "SCCPDH"   "AHCY"     "NDUFA13"  "ASMT"     "Z36811"  
    ## [43] "MRPL12"   "PRDX4"    "SEPT8"    "CCNB1"    "SIPA1L2"  "NELFE"   
    ## [49] "19926"    "SFN"      "TP53I11"


