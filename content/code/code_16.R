rm(list = ls())

library(MTS) 
library(astsa)

data("soi") # Southern Oscillation Index, related to sea surface temperature
data("rec") # Number of new fish
soi <- soi - mean(soi)
rec <- rec - mean(rec)

X <- cbind(soi, rec)
X <- X[1:400, ]

# This software only lets us add covariates to the VAR model
Z <- 1:length(rec)
Z.1 <- Z[1:nrow(X)]
Z.2 <- Z[(nrow(X) + 1):length(Z)]


varx <- VARX(X, p = 1, xt = Z.1, include.mean = FALSE, m = 0)
# Hard to get predictions out...


linfit <- lm(X~Z.1)

armaMTS <- VARMA(linfit$residuals, p = 1, q = 1, include.mean = FALSE)
armaMTS$Phi
armaMTS$Theta

varma.pred <- VARMApred(armaMTS, h = length(soi) - nrow(X))

plot(c(rec), col = "gray", ylim = c(-200, 200), type = "l", axes = FALSE, 
     xlab = "Time", ylab = "Recruitment")
lines(X[, 2])
# We'll need to add the fitted values onto our forecasts
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2] + linfit$coefficients[, 2][1] + linfit$coefficients[, 2][2]*Z.2, col = "blue")
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2] + linfit$coefficients[, 2][1] + linfit$coefficients[, 2][2]*Z.2 + qnorm(0.975)*varma.pred$se.err[, 2], col = "blue",
      lty = 2)
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2]+ linfit$coefficients[, 2][1] + linfit$coefficients[, 2][2]*Z.2 - qnorm(0.975)*varma.pred$se.err[, 2], col = "blue",
      lty = 2)
# Add linear model fit line just to get a sanity check
abline(a = linfit$coefficients[, 2][1], b = linfit$coefficients[, 2][2], lty = 1, col = "red")
axis(2, seq(-200, 200, by = 50))
axis(1, seq(0, length(rec) + 1, by = 50), c("", time(rec), "")[seq(0, length(rec) + 1, by = 50) + 1])

# What if we wanted to include seasonal indicators?
# We're going to construct our design matrices a little differently to make our life easier
month <- factor((round(time(rec), 3) - floor(time(rec))))
Z <- model.matrix(~month)[, -ncol(model.matrix(~month))]
Z.1 <- Z[1:nrow(X), ]
Z.2 <- Z[(nrow(X) + 1):nrow(Z), ]
linfit <- lm(X~Z.1-1)

armaMTS <- VARMA(linfit$residuals, p = 1, q = 1, include.mean = FALSE)
armaMTS$Phi
armaMTS$Theta

varma.pred <- VARMApred(armaMTS, h = length(soi) - nrow(X))

plot(c(rec), col = "gray", ylim = c(-200, 200), type = "l", axes = FALSE, 
     xlab = "Time", ylab = "Recruitment")
lines(X[, 2])
# We'll need to add the fitted values onto our forecasts
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2] + Z.2%*%linfit$coefficients[, 2], col = "blue")
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2] + Z.2%*%linfit$coefficients[, 2] + qnorm(0.975)*varma.pred$se.err[, 2], col = "blue",
      lty = 2)
lines((nrow(X) + 1):length(rec), varma.pred$pred[, 2]+ Z.2%*%linfit$coefficients[, 2] - qnorm(0.975)*varma.pred$se.err[, 2], col = "blue",
      lty = 2)
# Add linear model fit line just to get a sanity check
lines(Z.1%*%linfit$coefficients[, 2], lty = 1, col = "red")
axis(2, seq(-200, 200, by = 50))
axis(1, seq(0, length(rec) + 1, by = 50), c("", time(rec), "")[seq(0, length(rec) + 1, by = 50) + 1])

