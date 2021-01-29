# Designing, Running, and Analyzing Experiments
## Scott Klemmer
## Jacob O. Wobbrock

# Week 1: Basic Experiment Design Concepts
 - Two attributes that we often measured are performance and preference.
- Two approaches to experiments: Exploratory and Hypothesis.
- More participants = more power tfr. easier to detect differences.
- ”How many participants would convince you?”
-  Four Considerations for Experiment
    1. Participants
    2. Apparatus
    3. Procedure
    4. Design & Analysis
- Two topical categories of sampling; Probability Sampling vs Non-Probability Sampling
- Most people don’t want to be in a lab > 1 hr.

# Week 2: Tests of Proportions
- One Sample Test of Proportions
    1. `View()` to see in RStudio
    2. Categorical means the same as Nominal
- Pearson Chi-Squared Test
    1. `xtabs()` to generate cross table.
    2. `chisq.test()` to calculate statistic.
- An asymptotic test approximates the p value.
- An alternative is an exact test; which is computationally more expensive
- Binomial Test is one such exact test.
    1. `binom.test()` to run.
- You can use Chi-Squared test on multinomial tests.
 - Multinomial test requires `XNomial::xmulti`.


# Week 3: The T-Test
- Independent Variables: Variables we’re controlling.
- Dependent Variables: Variables that we’re measuring.

- Equation is: `Y ~ X + epsilon`
- **Measurement Error** is the deviation from reality that our experiment cannot capture.
- To compare two independent samples, use `t.test( y ~ x, data = data, var.equal = TRUE)`


# Week 4: Validity in Design and Analysis
**Confounds** introduce uncontrolled variability.
- Attempts to deal with confounding:
    1. Manipulate.
    2. Control for.
    3. Record or measure it.
    4. Hidden to us: affect.

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
- __Parametric Vs Nonparametric__: assumptions vs no assumptions.
- You can test normality using a **Shapiro-Wilk Test**: `shapiro.test(..)`.
- You can test lognormal using a **Kolmogorov-Smirnov test**: `ks.test(.., “plnorm”, meanlog= <data>, sdlog= <data>, exact = TRUE)`.
- You can test homoscedasticity using **Levene’s Test**; center of median is actually a **Brown-forsythe test**.
- If variances are significantly different, then you can use a **Welch T-Test** instead: passing `var.equal = FALSE`.
- If data violates the normality of residual assumption, then we can resolve that using transforms.
- The nonparametric version is called the **Mann-Whitney U Test**; credit also goes to Wilcox.
- Changing the logtime does not change the rank order so no impact on the results of the test.


# Week 5: One-Factor Between-Subjects Experiments
- **ANOVA** stands for *Analysis of Variance*.
- The nonparametric version of ANOVA is the **Kruskal-Wallis test**.

# Week 6: One-Factor Within-Subjects Experiments
- Within also means Repeated Measures.
- Within creates more data with less people.
- Because each subject does all three, then we must watch out for carryover effects // confounds
- We can detect this using another parameter Order of Choices.
- Three strategies:
    1. Full counterbalancing; Every border case: do if you can.
    2. Latin Squares; Rotate the arrangements around.
    3. Balanced Latin Squares: 1 2 n 3 n-1 5 n-2..; then new row +1
- Within can mean paired.
- Errors are often Poisson
- **Sphericity** is where the variance of differences between all combination of levels within a factor are equal.
- *Sphericity* must be met for multi-factor ANOVAs.
- If there is a violation, [...?]
- ges is abbr for Generalized Effect Size


# Week 7: Factorial Experiment Designs
- Aligned Rank Transform Procedure is an ANOVA for multi-factor ANOVAs.


# Week 8: Generalizing the Response
- Anova is a type of Linear Model.
- A Linear Model relates our factors with a response, assuming normalcy.
- A **Generalizable Linear Model** extends this beyond a Normal Dist.
- A GLM can only handle between subject factors.

# Week 9: The Power of Mixed Effects Models
- The Linear Model generalizes to the Generalizable Linear Model.
- There is such thing as a Linear Mixed Model.
- There is such a thing as a Generalizable Linear Mixed Model.
- Random Effects:
- Fixed Effects: Factors
- When you have both then you have a mixed model.
- Mixed Models are more computationally complicated.


# Research:

# Reference:
- Sampling?
- What is a Bonferroni correction?
- What is the G-Test?
- Fisher’s test?
  * `fisher.test()`
- Tukey Comparisons?
- F-Test?
- F - Distribution?
- coin package?
- PMCR package?
- fitdistrplus package?
- Wilcoxon signed-rank test?
- ez package?
- Geenhouse-Geisser Correction.?
- Huyng-Feldt?
- Friedman test?
- ez package
- ezANOVA?
- phia package?
- Multi-nomial Logistic Regression
- Ordinal Logistic Regression
- nnet package
- lme4 package
- lmerTest package
- multicomp package
- Goodness of Fit test
