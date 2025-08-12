library(revtools)

data_all <- read_bibliography(
  c("data/Psycinfo RHI.ris", "data/pubmed-Rubberhand-set.ris")
)

## manual check of duplicates
data_unique_manual <- screen_duplicates(data_all)
write.csv(data_unique_manual, file = "data/data_no_duplicates_manual.csv")

## automatic check of duplicates
matches <- find_duplicates(data_all,
                           to_lower = TRUE,
                           remove_punctuation = TRUE,
                           match_variable = "title")

data_unique <- extract_unique_references(data_all, matches)

nrow(data_all)
nrow(data_unique)
nrow(data_unique_manual)

write.csv(data_unique, file = "data/data_no_duplicates.csv")

write_bibliography(data_unique,
                   filename = "data/biblio_no_duplicates.bib",
                   format = "bib" )
