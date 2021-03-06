require(rms)
source('~/R/rms/R/bootcov.s')
source('~/R/rms/R/Predict.s')
set.seed(3)
n <- 15
y <- sample(1:10, n, TRUE)
x1 <- runif(n)
f <- lrm(y ~ x1, x=TRUE, y=TRUE)
g <- bootcov(f, B=500, coef.reps=TRUE)
m <- Mean(f)
Predict(f, x1=c(.25, .75), fun=m)
Predict(g, x1=c(.25, .75), fun='Mean')
h <- ols(y ~ x1)
Predict(h, x1=c(.25, .75))
