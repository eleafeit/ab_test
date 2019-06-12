// Stan code for Lewis and Rao 2015 data
// L&R only report the mean and standard deviation for the control group for each experiment
data {
int<lower=1> nexpt; // number of experiments
real<lower=2> nobs[nexpt]; // sample size for control group
real ybar[nexpt]; // observed mean for control group
real<lower=0> s[nexpt]; // observed standard deviation for experiment (pooled)
}
parameters {
real m[nexpt]; // true mean for control group in experiment
real mu; // mean across experiments
real<lower=0> sigma; //standard deviation across experiments
}
model {
  // priors
  mu ~ normal(0, 10);
  sigma ~ normal(0, 3);
  // likelihood
  for (i in 1:nexpt) {
	  m[i] ~ normal(mu, sigma);
	  ybar[i] ~ normal(m[i], s[i]/sqrt(nobs[i])); 
  }
}

