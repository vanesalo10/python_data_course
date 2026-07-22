# Snowflake Trial Setup

Snowflake is the hands-on cloud warehouse for this phase.

## What To Create

Create a Snowflake trial account from the Snowflake website:

https://www.snowflake.com/en/snowflake-trial/

Snowflake documentation describes trial accounts as self-service accounts that can be used to evaluate Snowflake with no payment information required. Snowflake's public trial page currently describes the AI Data Cloud trial as a 30-day experience with free credits.

## Signup Choices

During signup, the student will choose:

- Cloud provider: AWS, Azure, or GCP
- Region
- Snowflake edition

Recommended teaching choice:

- Choose a nearby region.
- Use the standard/default trial path unless a specific class needs Enterprise-only features.
- Avoid expensive features during the course.

## First Objects To Create

After logging in to Snowsight, run the setup script:

```sql
-- SQL_and_Warehouses/sql/snowflake/01_create_retail_dw_schema.sql
```

Then run:

```sql
-- SQL_and_Warehouses/sql/snowflake/02_seed_retail_dw_data.sql
-- SQL_and_Warehouses/sql/snowflake/03_denormalized_view.sql
```

For the workshop, run:

```sql
-- SQL_and_Warehouses/sql/workshop/snowflake/01_create_reconciliation_tables.sql
-- SQL_and_Warehouses/sql/workshop/snowflake/02_seed_target_data_with_issues.sql
```

## Cost Safety Habits

- Use a small warehouse.
- Stop or suspend the warehouse when not using it.
- Check remaining trial balance regularly.
- Do not load large files for this course phase.
- Do not leave repeated notebooks or scripts running.

## DBeaver Connection To Snowflake

Optional: DBeaver can also connect to Snowflake if the student wants one SQL tool for local databases and Snowflake.

Typical connection values:

| Setting | Value |
|---|---|
| Account | Snowflake account identifier, without `snowflakecomputing.com` |
| User | Snowflake username |
| Password | Snowflake password |
| Warehouse | Course warehouse |
| Database | `RETAIL_DW` |
| Schema | `ANALYTICS` |

## References

- Snowflake trial accounts: https://docs.snowflake.com/en/user-guide/admin-trial-account
- Snowflake trial signup: https://www.snowflake.com/en/snowflake-trial/
- Snowflake Python connector: https://docs.snowflake.com/en/developer-guide/python-connector/python-connector-connect

