**Authors and affiliations**

<div style="font-size: larger;">
Katerina Bittenglova<sup>1,2</sup>, Klara Zacharovova<sup>3</sup>, Filip Tichanek<sup>4</sup>, Ivan Leontovyc<sup>3</sup>, Peter Girman<sup>1</sup>, Jan Kriz<sup>1,2</sup>, Frantisek Saudek<sup>1,2,3</sup>, and Tomas Koblas<sup>2,3,5,6,7,&#42;</sup>
</div>

<br>

<sup>1</sup> Department of Diabetes, Institute for Clinical and Experimental Medicine, Prague, Czech Republic     
<sup>2</sup> First Faculty of Medicine, Charles University, Prague, Czech Republic     
<sup>3</sup> Laboratory of Pancreatic Islets, Center of Experimental Medicine, Institute for Clinical and Experimental Medicine, Prague, Czech Republic     
<sup>4</sup> Department of Data Science, Institute for Clinical and Experimental Medicine, Prague, Czech Republic     
<sup>5</sup> Department of Biochemistry, Faculty of Science, Charles University, Prague, Czech Republic     
<sup>6</sup> Lead contact     
<sup>7</sup> Senior author     
<sup>&#42;</sup> Correspondence: tomas.koblas@ikem.cz

---------------------------------------------------------------------------------------------------

This is a statistical report, code and data for the manuscript titled ***Cell cycle dynamics of synthetic mRNA induced β-cell proliferation*** (currently in preparation / under review).

When using this data, code or statistical report, please cite the manuscript and the archived Zenodo version of this repository (update once published):

> Bittenglova K., Zacharovova K., Tichanek F., Leontovyc I., Girman P., Kriz J., Saudek F., Koblas T. Cell cycle dynamics of synthetic mRNA induced β-cell proliferation. *[Journal Name]* (Year). [DOI]


---------------------------------------------------------------------------------------------------

Original [GitHub repository](https://github.com/filip-tichanek/beta_cells/): https://github.com/filip-tichanek/beta_cells

Statistical **report** can be found [here](https://filip-tichanek.github.io/beta_cells/)

# Archived version

The manuscript-submission version of this repository is archived on Zenodo:

- Concept DOI: https://doi.org/10.5281/zenodo.22095339

----------------------------------------------------------------------------------------------------

# General analytical workflow

For each analyzed beta cell population, the analysis follows this workflow:

1. **Exploratory data analysis:** First, the raw data are visualized across individual experiments to identify general temporal trends and visually assess variance stability (heteroscedasticity).   

2. **Model selection:** Candidate models fitted via Maximum Likelihood (ML) are compared using AIC and BIC criteria. Simple linear models without random effects are included purely for baseline comparison; a mixed-effects framework with a random intercept for the experiment is required by design to account for within-experiment dependency.    

3. **Diagnostics:** Simulated residuals (via the DHARMa package) are evaluated to check distributional assumptions. This step focuses specifically on comparing mixed-effects models with a global residual variance versus models allowing for group-specific residual variance.    

4. **Final model fit:** Based on the information criteria and residual diagnostics, the final mixed-effects model is selected for statistical inference.    

5. **Statistical inference:** Overall effects of experimental group (time point or untreated control, where applicable) were assessed using Wald chi-square omnibus tests (`car::Anova`). Pairwise comparisons of estimated marginal means were performed using the `emmeans` package. All pairwise P-values and confidence intervals were adjusted using the Bonferroni correction.

6. **Visualization:** The final results are plotted as means ± standard errors of the mean (SEM), with significance indicators for specified pairwise comparisons shown where applicable.   

7. **Summary statistics:** Finally, a table with raw descriptive statistics (mean, median, SD, and SEM) is provided for each time point/control group.   
