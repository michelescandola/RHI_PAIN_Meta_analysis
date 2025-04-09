library(revtools)

data_all <- read_bibliography(
  c("data/Psycinfo RHI.ris", "data/pubmed-Rubberhand-set.ris")
)

screen_duplicates(data_all)

matches <- find_duplicates(data_all,
                           to_lower = TRUE,
                           remove_punctuation = TRUE,
                           match_variable = "title")

data_unique <- extract_unique_references(data_all, matches)

nrow(data_all)
nrow(data_unique)

write.csv(data_unique, file = "data/data_no_duplicates.csv")

write_bibliography(data_unique,
                   filename = "data/biblio_no_duplicates.bib",
                   format = "bib" )
