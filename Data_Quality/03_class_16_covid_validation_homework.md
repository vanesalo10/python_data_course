# Class 16 Homework: COVID-19 Data Quality Validation Workshop

## Project Goal

Build a Jupyter notebook that cleans, explores, transforms, reconciles, and validates two COVID-19 datasets.

This project is the final workshop for **Phase 2: Pandas For Data Quality Validations**. The goal is not only to analyze the data, but to prove that the data is trustworthy enough to use.

## Data Sources

Use two data sources:

1. Kaggle dataset: COVID-19 Dataset by imdevskp  
   Download it from Kaggle: https://www.kaggle.com/datasets/imdevskp/corona-virus-report

2. Teacher-provided CSV: `COVID19_Statistics_200_Rows-1 - COVID19_Statistics_200_Rows-1.csv`

For the Kaggle dataset, use at least one country-level or date-level file. Recommended files:

- `covid_19_clean_complete.csv`
- `full_grouped.csv`
- `country_wise_latest.csv`
- `worldometer_data.csv`

The Kaggle dataset page describes the dataset as daily global COVID-19 confirmed, death, and recovered case data, with files such as `full_grouped.csv`, `covid_19_clean_complete.csv`, `country_wise_latest.csv`, `day_wise.csv`, `usa_county_wise.csv`, and `worldometer_data.csv`.

## Deliverable

Create one notebook:

```text
Homeworks/03_covid_validation_workshop.ipynb
```

Your notebook must include:

- Markdown explanations for each section
- pandas code
- cleaned DataFrames
- validation checks
- a final validation report table
- answers to the business questions
- a short conclusion explaining whether the data is reliable enough to use

## Business Questions

Answer these two questions after cleaning and validating the data:

1. Which countries or regions show the highest COVID-19 severity based on fatality rate, active-case rate, or confirmed cases?
2. Does higher testing or vaccination coverage appear to be associated with lower active-case rates in the teacher-provided dataset?

Optional additional question:

- How consistent are the country-level totals between the Kaggle dataset and the teacher-provided dataset after standardizing country names?

## Required Notebook Structure

### 1. Introduction

Explain:

- which two data sources you are using
- what each dataset represents
- what business questions you will answer
- what data quality checks you plan to run

### 2. Load The Data

Use pandas to load both datasets.

Requirements:

- Import pandas.
- Load the teacher-provided CSV.
- Load at least one CSV from the Kaggle dataset.
- Display the first rows of each dataset.
- Print the shape of each dataset.

Expected methods:

- `pd.read_csv()`
- `.head()`
- `.shape`

### 3. Explore The Data

For each dataset, inspect:

- column names
- data types
- missing values
- unique values for important categorical columns
- basic descriptive statistics

Expected methods:

- `.info()`
- `.describe()`
- `.isna().sum()`
- `.value_counts()`
- `.nunique()`

Specific tasks for the teacher-provided CSV:

- Confirm it has 200 rows.
- Check whether `Record_ID` is unique.
- Show unique values for `Country`.
- Show unique values for `State`.
- Create a missing-value summary table.

### 4. Clean Column Names

Standardize column names for both datasets.

Requirements:

- Convert column names to lowercase.
- Replace spaces or special characters with underscores.
- Rename columns when needed so similar fields have similar names across datasets.

Examples:

- `Record_ID` -> `record_id`
- `Tests_Conducted` -> `tests_conducted`
- `Vaccination_Rate_%` -> `vaccination_rate_pct`
- `Country/Region` -> `country`
- `Province/State` -> `state`

### 5. Clean Text Values

Clean country and state names.

Specific issues found in the teacher-provided CSV:

- Some country values have leading spaces, such as ` India`, ` Japan`, and ` UK`.
- Some state values have inconsistent spaces, casing, or spelling:
  - `california`
  - `Californi-a`
  - `Tokyo `
  - `Tokyio`
  - `Sao-Paulo`
  - `Maharashtra `
  - ` Maharashtra`
  - ` England `

Requirements:

- Use string methods such as `.str.strip()`, `.str.title()`, or `.replace()`.
- Standardize country names.
- Standardize state names.
- Show before-and-after value counts for `country` and `state`.

Expected methods:

- `.str.strip()`
- `.str.replace()`
- `.replace()`
- `.value_counts()`

### 6. Clean And Validate Dates

Convert date columns to datetime.

Specific issues found in the teacher-provided CSV:

- Three values do not parse cleanly with the default pandas parser:
  - `2021/01/11`
  - `2021/02/27`
  - `21-03-22`
- Two parsed dates are outside the expected 2021 range:
  - `1997-04-18`
  - `9999-07-20`

Requirements:

- Convert date columns using `pd.to_datetime()`.
- Use `errors="coerce"` to detect invalid or unusual formats.
- Identify rows where dates failed to parse.
- Identify dates outside the expected range.
- Decide how to handle invalid or out-of-range dates.
- Explain your decision in Markdown.

Expected methods:

- `pd.to_datetime()`
- `.isna()`
- boolean masks
- `.loc[]`

### 7. Clean Numeric Values

Validate numeric columns.

For the teacher-provided CSV, check these columns:

- `confirmed`
- `recovered`
- `deaths`
- `active`
- `tests_conducted`
- `vaccination_rate_pct`

Specific issues found:

- `active` contains three invalid `-9999` values.
- `vaccination_rate_pct` should be between 0 and 100.
- `tests_conducted` should not be lower than `confirmed`.
- `recovered`, `deaths`, and `active` should not be greater than `confirmed`.

Requirements:

- Check minimum and maximum values.
- Find negative values.
- Replace invalid placeholder values such as `-9999` with `NaN` or a corrected value.
- Explain why you chose your cleaning strategy.

Expected methods:

- `.min()`
- `.max()`
- boolean masks
- `.replace()`
- `.fillna()` only if you can justify it

### 8. Create Derived Columns

Create useful analytical columns.

Required derived columns:

- `fatality_rate = deaths / confirmed`
- `recovery_rate = recovered / confirmed`
- `active_rate = active / confirmed`
- `test_positivity_rate = confirmed / tests_conducted`

For the teacher-provided CSV, also create:

- `vaccination_group`
  - `low` for vaccination rate below 40
  - `medium` for 40 to 69
  - `high` for 70 and above

Requirements:

- Avoid division-by-zero errors.
- Explain what each derived column means.
- Show summary statistics for the new columns.

### 9. Aggregations

Use `groupby` to summarize the cleaned data.

Required aggregations:

- Total confirmed cases by country.
- Total deaths by country.
- Average fatality rate by country.
- Average vaccination rate by country in the teacher-provided CSV.
- Average active rate by `vaccination_group`.

Expected methods:

- `.groupby()`
- `.agg()`
- `.sort_values()`

### 10. Reconciliation Between Sources

Use pandas merge logic to compare the two sources.

Reconciliation options:

- Compare country names that appear in both datasets.
- Compare total confirmed cases by country.
- Compare death totals by country.
- Compare date ranges.

Requirements:

- Create a country-level summary for the Kaggle dataset.
- Create a country-level summary for the teacher-provided dataset.
- Merge the summaries by standardized country name.
- Create difference columns.
- Identify countries that appear in one source but not the other.

Expected methods:

- `.merge()`
- `how="outer"`
- suffixes such as `_kaggle` and `_teacher`
- difference calculations

Important note:

The two sources may not cover the exact same time range or geography. If the numbers do not match, do not assume one source is wrong. Investigate whether the mismatch is caused by different date ranges, aggregation levels, or definitions.

### 11. Data Quality Validation Report

Create a final validation report DataFrame.

Your report must include at least these columns:

- `check_name`
- `dataset`
- `column`
- `expectation`
- `observed_value`
- `failed_rows`
- `severity`
- `passed`

Required checks:

- Row count is greater than zero.
- Required columns exist.
- Primary key or record identifier is unique where applicable.
- Required fields are not null.
- Dates parse successfully.
- Dates are inside expected ranges.
- Numeric values are non-negative.
- `vaccination_rate_pct` is between 0 and 100.
- `tests_conducted >= confirmed`.
- `confirmed = recovered + deaths + active` for the teacher-provided CSV after cleaning.
- Country names are standardized.
- No unexpected country or state variants remain after cleaning.

Suggested severity levels:

- `high`: check failure blocks analysis
- `medium`: check failure requires investigation
- `low`: check failure should be documented

### 12. Answer The Business Questions

Use your cleaned and validated data to answer:

1. Which countries or regions show the highest COVID-19 severity based on fatality rate, active-case rate, or confirmed cases?
2. Does higher testing or vaccination coverage appear to be associated with lower active-case rates in the teacher-provided dataset?

Your answers must include:

- one or more summary tables
- at least one chart or sorted table
- a short written interpretation
- a warning about any data quality limitations

### 13. Final Conclusion

Write a short conclusion answering:

- What issues did you find?
- What issues did you fix?
- What issues remain?
- Is the cleaned data reliable enough to answer the business questions?
- What would you ask the data provider before using this data in a real business report?

## Minimum Technical Requirements

Your notebook must demonstrate skills from Classes 10 to 15:

| Phase 2 Class | Skill | Required Evidence In Notebook |
|---|---|---|
| 10 | Loading and saving data | Load both CSV files with pandas |
| 11 | Exploration | Use `info`, `describe`, `value_counts`, missing summaries |
| 12 | Cleaning | Fix dates, text values, invalid numeric values |
| 13 | Transformations | Create rates and vaccination groups |
| 14 | Aggregations and reconciliation | Use `groupby`, `merge`, and source-vs-source comparisons |
| 15 | DQ validation patterns | Build a validation report with pass/fail checks |
| 16 | Workshop | Combine all skills into one practical project notebook |

## Suggested Grading Rubric

| Category | Points |
|---|---:|
| Loads both data sources correctly | 10 |
| Explores both datasets clearly | 10 |
| Cleans text, dates, and numeric values | 20 |
| Creates useful derived columns | 10 |
| Uses aggregations to summarize the data | 10 |
| Reconciles Kaggle and teacher-provided data | 15 |
| Builds a clear validation report | 15 |
| Answers business questions with evidence | 10 |
| **Total** | **100** |

## Submission Checklist

Before submitting, confirm:

- The notebook runs from top to bottom.
- Both data sources are loaded.
- Cleaning decisions are explained in Markdown.
- Validation checks are visible and easy to read.
- Failed checks are not hidden.
- Business questions are answered with cleaned data.
- The final conclusion explains data limitations.

## Helpful Hints

- Keep the raw DataFrames unchanged and create cleaned copies.
- Use small helper functions for repeated validation checks.
- Do not delete suspicious rows without explaining why.
- When values do not match between sources, investigate before making assumptions.
- A failed validation check is not a bad result. It is useful evidence.

