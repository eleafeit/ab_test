# Data generation for A/B Testing Workshop
# Elea McDonnell Feit
# 7 June 2019

# Generates synthetic data for a hypothetical online wine retailer. 

set.seed(89109) 

N <- 123988 # number of users in the test

d <- data.frame(user_id = 1000001:(1000000 + N), 
                cpgn_id = "1901Email")

# baseline covariates -----
# past purchases (by category)
library(MASS)
Sigma <- matrix(c(1, 0.3, -0.4, -0.4, 
                  0.3, 1, -0.3, -0.3, 
                  -0.4, -0.3, 1, 0.2, 
                  -0.4, -0.3, 0.2, 1), nrow=4)
t <- exp(mvrnorm(N, mu=c(5, 5, 4, 3.5), Sigma=Sigma))
t <- t*sample(c(0,1), size=N*4, replace=TRUE, prob=c(0.7,0.3))
t[t<10] <- 0
t <- round(t, digits=2)
d$chard <- t[,1]
d$sav_blanc <- t[,2]
d$syrah <- t[,3]
d$cab <- t[,4]
d$past_purch <- d$chard + d$sav_blanc + d$syrah + d$cab
# last purchase date
d$days_since = round(rexp(N, rate = 1/90))
# website visits
d$visits = rpois(N, 5 + d$past_purch/200)
d$visits[d$visits < 0] <- 0
d$visits[d$visits == 0 & d$past_purch > 0] <- 1 # at least one visit for purchasers


# RANDOMIZED treatment assignment -----
# bernoulli assignment (N known in advance)
# d$group <- sample(c("email_A", "email_B", "ctrl"), size=N, 
#                      replace=TRUE, prob=rep(1/3, 3))
# completely random assignment (N known in advance)
d$group <- NA
rand <- sample(1:N, size=N)
d$group[rand][1:round(N/3)] <- "email_A"
d$group[rand][1:round(N/3) + round(N/3)] <- "email_B"
d$group[is.na(d$group)] <- "ctrl"
d$group <- factor(d$group, c("email_A", "email_B", "ctrl"))
d$email <- d$group != "ctrl"

# test outcomes -----
p <-  1/(1+exp(-1 - d$past_purch/100 + d$days_since/60 - 0.5*(d$group=="email_A")))
d$open <- (runif(N) < p) * 1
d$open[d$group == "ctrl"] <- 0
p <- 1/(1+exp(2 - 0.5*(d$group=="email_A") - 0.5*(d$syrah >0)*(d$group=="email_B")))
d$click <- (runif(N) < p) * 1
d$click[!(d$open==1)] <- 0
p <-  1/(1+exp(1 - d$past_purch/300 - (d$visits > 3)*d$email + d$days_since/60 - (d$group != "ctrl")*d$past_purch/300 - 1*(d$click==1)))
d$purch <- round(exp(rnorm(N, mean=3.6, sd=1)) * (runif(N) < p), 2)
d$purch[d$purch<12.32] <- 0

# inspect and write out -----
summary(d)
summary(d$open >= d$click)
summary(d$past_purch>0 & d$visits==0)
mosaicplot(table(d$group, d$open))
prop.test(table(d$group, d$open))
mosaicplot(table(d$group, d$click))
prop.test(table(d$group, d$click))
mosaicplot(table(d$group, d$purch>0))
prop.test(table(d$group, d$purch==0))
plot(purch ~ group, data=d)

d <- d[,c(1:2, 10:14, 3:9)]
write.csv(d, file="~/repos/ab_test/code/test_data.csv", row.names = FALSE)
