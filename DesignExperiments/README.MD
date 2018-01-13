# Designing, Running, and Analyzing Experiments
## Scott Klemmer
## Jacob O. Wobbrock

# Week 1 [2017/06/07]
- Two attributes that we often measured are performance and preference.
- Two approaches to experiments: Exploratory and Hypothesis.
- More participants = more power tfr. easier to detect differences.
- ”How many participants would convince you?”
- Four Considerations for Experiment
  1. Participants
  2. Apparatus
  3. Procedure
  4. Design & Analysis
- Two topical categories of sampling:
  1. Probability Sampling
  2.  Non-Probability Sampling
- Most people don’t want to be in a lab > 1 hr.
# Week 2 [2017/06/08]
- One Sample Test of Proportions
- `View()` to see in RStudio
- Categorical = Nominal
- Pearson Chi-Squared Test
- `xtabs()` to generate cross table.
- `chisq.test()` to calculate statistic.
- An asymptotic test approximates the p value.
- An alternative is an exact test which is computationally more expensive
- Binomial Test is one such exact test.
- `binom.test()` to run.
- You can use Chi-Squared test on multinomial tests.
- Multinomial test requires `XNomial::xmulti()`.


# Week 3 [2017/06/10]
- Independent Variables: Variables we’re controlling.
- Dependent Variables: Variables that we’re measuring.
- `Y ~ X + E`.
- Measurement Error is the deviation from reality that our experiment cannot capture.
- To compare two independent samples, use `t.test( y ~ x, data = data, var.equal = TRUE)`.

# Week 4 [2017/06/10]
- Confounds introduce uncontrolled variability.
- Attempts to deal with confounding:
  * Manipulate.
  * Control for
  * Record or measure it.
- They could be Hidden to us, affect.
- Analysis Of Variance Assumptions:
  1. Assumption of independence.
  2. Normality; Normally Distributed residuals
  3. Homoscedasticity; homogeneity of Variance.
- Data Distributions:
  * Normal
  * Lognormal
  * Exponential
  * Gamma
  * Poisson Binomial
- Parametric Vs Nonparametric: assumptions vs no assumptions.
- You can test normality using a Shapiro-Wilk Test: `shapiro.test(..)`.
- You can test lognormal using a Kolmogorov-Smirnov test: `ks.test(.., “plnorm”, meanlog= <data>, sdlog= <data>, exact = TRUE)`.
- You can test homoscedasticity using Levene’s Test; center of median is actually a Brown-forsythe test.
- If variances are significantly different, then you can use a Welch T-Test instead passing `var.equal = FALSE`.
- If data violates the normality of residual assumption, then we can resolve that using transforms.
- The nonparametric version is called the Mann-Whitney U Test; credit also goes to Wilcox.
- Changing the logtime doesn’t change the rank order so no impact on the results of the test.

# Week 5 [2017/06/11]
- ANOVA stands for **Analysis of Variance**.
- The nonparametric version of ANOVA is the Kruskal-Wallis test.

# Week 6 [2017/06/12]
- Within also means Repeated Measures.
- Within creates more data with less people.
- Because each subject does all three, then we must watch out for carryover effects // confounds
- We can detect this using another parameter Order of Choices.
- Three strategies:
  1. Full counterbalancing
  2. Latin Squares.
  3. Balanced Latin Squares
    1. Every border case; do if you can.
    2. Rotate the arrangements around.
    3. 1 2 n 3 n-1 5 n-2..; then new row +1

- Within can mean paired.
- Errors are often Poisson

- Sphericity is where the variance of differences between all combination of levels within a factor are equal.
- Sphericity must be met for multi-factor ANOVAs.
- *ges* is and abbreviation for **Generalized Effect Size**.

# Week 7 [2017/06/13]
- Aligned Rank Transform Procedure is an ANOVA for multi-factor ANOVAs

# Week 8 [2017/06/14]
- Anova is a type of Linear Model.
- A Linear Model relates our factors with a response, assuming normalcy.
- A Generalizable Linear Model extends this beyond a Normal Dist.
- A GLM can only handle between subject factors.

# Week 9 [2017/06/14]
- The Linear Model generalizes to the Generalizable Linear Model.
- There is such thing as a Linear Mixed Model.
- There is such a thing as a Generalizable Linear Mixed Model.
- Random Effects:
- Fixed Effects: Factors
- When you have both then you have a mixed model.
- Mixed Models are more computationally complicated.
- Nested Effects




# Research:
- What is a Bonferroni correction?
- What is the G-Test?
- Fisher’s test `fisher.test()` ?
- Brown-forsythe test ?
- Tukey Comparisons?
- F-Test?
- F - Distribution?
- coin package ?
- PMCR package ?
- Kruskal-Wallis ?
- fitdistrplus package ?
- Wilcoxon signed-rank test?
- ez package ?
- Geenhouse-Geisser Correction ?
- Huyng-Feldt ?
- Friedman test ?
- ezANOVA ?
- phia package ?
- Multi-nomial Logistic Regression ?
- Ordinal Logistic Regression ?
- nnet package ?
- lme4 package ?
- lmerTest package ?
- multicomp package ?
- Goodness of Fit test?
