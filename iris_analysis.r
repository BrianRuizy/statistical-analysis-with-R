# importing modules
library('ggplot2')

# Isis is an included clean statistical dataset within R, useful for exploration learning
data(iris)  
head(iris)
str(iris)
summary(iris)

test1 <- subset(iris, iris$Species == 'virginica')
summary(test1)
head(test1)
str(test1)

test2 <- subset(iris, iris$Species =='setosa' & iris$Sepal.length > 6)
summary(test2)

# create a new column that stores logical values
iris$greater.half = iris$Sepal.Width > 0.5 * iris$Sepal.length
heaed(iris)
sum(iris$greater.half=='TRUE')

# visualization
plot(iris)
plot(iris$Sepal.Width, iris$Sepal.Length)

fit.lm <- lm(Is.Versicolor ~ Petal.Length + Sepal.Length, data = iris)
summary(fit.lm)

# we seek to plot and compare petal lenght with sepal length
fit.logit <- glm(Is.Versicolor ~ Petal.Length + Sepal.Length, data = iris, family = binomial(link = 'logit'))
summary(fit.logit)

iris[['Predict.Versicolor.logit']] <- as.numeric(predict(fit.logit) > 0.5)
table(iris[, c('Is.Versicolor', 'Predict.Versicolor.logit')])

# we find that there does indeed exist a large positive correlation between the two
cor(iris[, c('Petal.Length', 'Sepal.Length')])
