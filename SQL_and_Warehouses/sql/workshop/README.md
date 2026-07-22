# Workshop: SQL Plus Pandas Reconciliation

The workshop uses the same logical order table in MySQL and Snowflake.

- MySQL represents the source system.
- Snowflake represents the warehouse target.
- The target data intentionally contains mismatches.

The student should:

1. Create and seed the MySQL source table.
2. Create and seed the Snowflake target table.
3. Use Python to read both tables into pandas.
4. Reuse the reconciliation ideas from `Data_Quality/01_pandas_reconciliation.ipynb`.
5. Reuse the validation report ideas from `Data_Quality/02_validation_report_notebook.ipynb`.

## Intentional Issues

- `order_id = 1007` exists in MySQL but is missing from Snowflake.
- `order_id = 1009` exists in Snowflake but not in MySQL.
- `order_id = 1003` has changed discount and net amount values in Snowflake.

