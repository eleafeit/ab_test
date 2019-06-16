---
output:
  html_document: default
  pdf_document: default
---
# Advanced A/B Testing Workshop

Elea McDonnell Feit, Drexel University

Prepared for the 2019 Marketing Analytics Summit

## Workshop description
There is nothing better than a head-to-head A/B test to drive marketing decisions.  A/B tests lead to simple analytics that almost everyone in the organization can understand and act on. If you’ve run at least a few A/B tests, this workshop will show you how to use more powerful analytics tools like predictive modeling to get more insight out of your tests. After reviewing the basics of A/B test analysis, we will talk about testing strategies you can use when you have a very large or very small sample sizes. We will cover a pile of advanced techniques including heterogeneous treatment effects, uplift modeling, causal forests, blocking, matching, and post-stratification. If this sound like a bunch of jargon to you right now, that’s okay. I will demystify the jargon and help you understand when and why you might use these techniques in analyzing your A/B tests. We will also cover profit-maximizing Bayesian approaches to A/B testing including test & roll and multi-armed bandits. 

## Workshop outline
1. [Introduction](https://eleafeit.github.io/ab_test/code/1_intro.html)
2. [A/B Test Basics](https://eleafeit.github.io/ab_test/code/2_basics.html)
    - Randomization checks
    - Analysis
    - Sample size planning
3. [When your sample size is big](https://eleafeit.github.io/ab_test/code/3_large_sample.html)
    - Slice and dice 
    - Uplift modeling
    - Causal forests
4. [When your sample size is small](https://eleafeit.github.io/ab_test/code/4_small_sample.html)
    - Post-stratification
    - Pre-test matching
5. [Maximizing profits](https://eleafeit.github.io/ab_test/code/5_profit_max.html)
    - Test & roll
    - Multi-armed bandits
6. When you can't randomize 
    - Propensity matching
    - Causal forests

### Is this for me? 
If you know what an A/B test is and you are enthusiastic about learning more advanced analytics techniques, this workshop is for you. My goal is to make sure you have an overall understanding of what these techniques do and when you would use them, without getting bogged down with technical details. By the end of the workshop, you will be ready to turbo-charge your A/B testing program. You may need to collaborate a data scientist execute on some of the concepts, but you will know what it is you want that data scientist to do. 

### Will there be hands-on-examples? 
Yes! During the workshop, I will be working examples in R. If you don’t know R, you can still follow the workshop focus on the concepts. You don’t have to know how to write R code to understand what I’m doing and what the results mean. If you do know some R, all the code will be available in advance and you are welcome to follow along during the workshop. (I’m sad that I won’t have time to teach R to novices in the workshop, but you might check out my book [R for Marketing Research and Analytics](http://r-marketing.r-forge.r-project.org/).) 

### Take aways
- How do you get more out of your A/B tests when your sample sizes are really big or way too small? 
- Can I get more lift by deploying my marketing to the right customers or stores? 
- How do “classical” and Bayesian approaches to A/B testing differ?

