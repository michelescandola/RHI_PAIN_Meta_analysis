install.packages("revtools")
library(revtools)

## screening of titles and abstracts:
screen_abstracts(x = read_bibliography("data/biblio_no_duplicates.bib"))
screen_abstracts(x = read_bibliography("ongoing_bib.csv"))

## then aggregate_tasks
output <- aggregate_tasks(file_names = c("data/ML.csv", "data/FS.csv"),
                match_column = "label",
                selection_column = "screened_abstracts",
                reviewer_names = c("ML", "FS"))
write.csv(output, file = "first_stage.csv")

