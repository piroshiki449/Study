import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.multicomp import pairwise_tukeyhsd, MultiComparison
import pandas as pd

# Load the dataset (assuming sashelp.baseball is available as a CSV or similar)
# For demonstration, let's assume it's loaded into a DataFrame named baseball
# baseball = pd.read_csv('sashelp_baseball.csv')

# Example structure of baseball DataFrame:
# baseball = pd.DataFrame({
#     'salary': [...],
#     'div': [...]
# })

# Fit the ANOVA model
model = ols('salary ~ C(div)', data=baseball).fit()

# Perform ANOVA
anova_table = sm.stats.anova_lm(model, typ=2)

# Post-hoc test: Tukey's HSD for all pairwise comparisons
mc = MultiComparison(baseball['salary'], baseball['div'])
tukey_result = mc.tukeyhsd()

print(anova_table)
print(tukey_result.summary())

# For Dunnett's test (control group 'AE'), Python does not have a direct implementation in statsmodels.
# It requires custom implementation or use of other specialized libraries.