# Data generation for A/B Testing Workshop
# Elea McDonnell Feit
# 7 June 2019

N <- 123988 # number of users in the test

d <- data.frame(user_id = 1000001:(1000000 + N), 
                cpgn_id = "1901Email")

# pre-test z's
# category purchases
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
d$last_purch = round(exp(rnorm(N, mean=0, sd=5))) 
d$visits = round(d$past_purch/10 + rnorm(N, mean=5, sd=5))
d$visits[d$visits < 0] <- 1 * (d$past_purch>0) # at least one visit for purchasers

  
# test outcomes
d$open
d$click
d$
group_id = sample(c("A", "B"), N, replace=TRUE)

summary(d)

write.csv(d, filename="~/repos/ab_test/test_data.csv")