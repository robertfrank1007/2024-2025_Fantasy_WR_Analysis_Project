# install packages
install.packages("readxl")
library(readxl)

# import data set from excel
file_path <- "/Users/robertfrank/Desktop/Robert Frank/Projects/2024-2025 NFL Wider Receiver Analysis Project/analysis.xlsx"
data <- read_excel(file_path)
head(data)
data

# find summary data
summary(data)

# create correlation matrix
correlation_matrix <- cor(data[, c("FPTS/G", "REC", "TGT", "RECYDS", "LG", "RECTD", "Y/R", "20+")], use = "complete.obs")
correlation_matrix

# create density plot of all receivers 
par(mar = c(3, 3, 3, 3))

plot(density(data$`FPTS/G`), 
     main = "Density Plot of Fantasy Points per Game", 
     xlab = "Fantasy Points", 
     col = "black", 
     lwd = 2) 

# sort by FPTS/G and create new data set of top 50 receivers
sorted_data <- data[order(data$'FPTS/G', decreasing = TRUE), ]
sorted_data

top_50 <- head(sorted_data, 50)
top_50

# create new correlation matrix of top 50 receivers
top_50_correlation_matrix <- cor(top_50[, c("FPTS/G", "REC", "TGT", "RECYDS", "LG", "RECTD", "Y/R", "20+")], use = "complete.obs")
top_50_correlation_matrix

# create density plot of top 50 receivers 
plot(density(top_50$`FPTS/G`), 
     main = "Density Plot of Fantasy Points", 
     xlab = "Fantasy Points", 
     col = "blue", 
     lwd = 2) 

# create new data set of 10-60
top_10_through_60 <- sorted_data[10:60, ]
top_10_through_60

plot(density(top_10_through_60$`FPTS/G`), 
     main = "Density Plot of Fantasy Points", 
     xlab = "Fantasy Points", 
     col = "blue", 
     lwd = 2) 

