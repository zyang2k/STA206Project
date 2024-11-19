# EDA 1118

# read data
# install.packages("bsamGP")
library(bsamGP)
data("plasma")

####################################################################
################# summary stats ########################
####################################################################
summary(plasma)

####################################################################
################# categorical variable EDA ########################
####################################################################

# List of categorical columns to plot against betaplasma
categorical_columns <- c("sex", "smoke", "vituse")

# Setting up the plotting area to show multiple plots
par(mfrow = c(1, length(categorical_columns)))  # 1 row, number of columns is equal to the length of categorical variables

# Generate boxplots for each categorical variable
for (col in categorical_columns) {
  boxplot(plasma$betaplasma ~ plasma[[col]], 
          main = paste("betaplasma by", col), 
          xlab = col, ylab = "betaplasma")
}


# Setting up the plotting area to show multiple plots
par(mfrow = c(1, length(categorical_columns)))  # 1 row, number of columns is equal to the length of categorical variables

# Generate boxplots for each categorical variable
for (col in categorical_columns) {
  boxplot(plasma$retplasma ~ plasma[[col]], 
          main = paste("retplasma by", col), 
          xlab = col, ylab = "retplasma")
}

# Reset plot layout to default (if needed)
par(mfrow = c(1, 1))


####################################################################
################# numerical variable EDA ########################
####################################################################


# Selecting numerical columns from the plasma dataset
numerical_columns <- c("age", "bmi", "calories", "fat", "fiber", "alcohol", "cholesterol", "betadiet", "retdiet", "betaplasma", "retplasma")

# Calculating the correlation matrix
cor_matrix <- cor(plasma[numerical_columns], use = "complete.obs")

# Displaying the correlation matrix
print(cor_matrix)

# Visualizing the correlation matrix using base R function 'heatmap'
heatmap(cor_matrix, symm = TRUE, main = "Correlation Matrix of Numerical Variables", col = colorRampPalette(c("blue", "white", "red"))(20))


