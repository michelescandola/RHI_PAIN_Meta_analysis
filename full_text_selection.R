# install.packages("revtools")
library(revtools)

# convert from csv2 to csv format (comma instead of semicolumn to divide columns)
ML <- read.csv2("data/fix_full_paper_ML.csv")
write.csv(ML, file = "data/full_paper_ML_comma.csv")

FS <- read.csv2("data/fix_full_paper_FS.csv")
write.csv(FS, file = "data/full_paper_FS_comma.csv")

rm(ML, FS)

## then aggregate_tasks
output <- aggregate_tasks(file_names = c("data/full_paper_ML_comma.csv", "data/full_paper_FS_comma.csv"),
                          match_column = "label",
                          selection_column = "screened_full_paper",
                          reviewer_names = c("ML", "FS"))
write.csv(output, file = "data/second_stage.csv")

mean(
  output$results_FS == output$results_ML, na.rm = TRUE
) ## 0.825

raters <- output[,c("results_ML", "results_FS")]
raters <- ifelse(raters == "excluded", 0, 1)

psych::cohen.kappa(raters)
# Call: cohen.kappa1(x = x, w = w, n.obs = n.obs, alpha = alpha, levels = levels, 
#                    w.exp = w.exp)
# 
# Cohen Kappa and Weighted Kappa correlation coefficients and confidence boundaries 
# lower estimate upper
# unweighted kappa  0.11     0.44  0.77
# weighted kappa    0.11     0.44  0.77
# 
# Number of subjects = 40

write.csv(output[output$results_FS != output$results_ML,],
          file = "data/full_text_inc.csv")
write.csv(
  output[(output$results_FS == output$results_ML) &
           output$results_ML == "selected",],
  file = "data/full_text_selected.csv"
)
