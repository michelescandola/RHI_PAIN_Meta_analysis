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
write.csv(output, file = "data/first_stage.csv")

mean(
  output$results_FS == output$results_ML
) ## 0.9587426

raters <- output[,c("results_ML", "results_FS")]
raters <- ifelse(raters == "excluded", 0, 1)

psych::cohen.kappa(raters)
# Call: cohen.kappa1(x = x, w = w, n.obs = n.obs, alpha = alpha, levels = levels, 
#                    w.exp = w.exp)
# 
# Cohen Kappa and Weighted Kappa correlation coefficients and confidence boundaries 
# lower estimate upper
# unweighted kappa  0.58      0.7  0.82
# weighted kappa    0.58      0.7  0.82
# 
# Number of subjects = 509 

write.csv(output[output$results_FS != output$results_ML,],
          file = "title_abstract_inc.csv")
write.csv(
  output[(output$results_FS == output$results_ML) &
           output$results_ML == "selected",],
  file = "selected.csv"
)
