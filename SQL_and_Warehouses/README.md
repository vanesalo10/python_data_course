# Phase 3: SQL And Warehouse Workflows

This module prepares the student to work with relational databases, SQL, local database tools, Snowflake, and Python database connections.

## What This Module Contains

- `docs/`: setup guides and conceptual references
- `docker/`: local MySQL and PostgreSQL lab environment
- `sql/mysql/`: MySQL schema, seed data, and views
- `sql/postgres/`: PostgreSQL schema, seed data, and views
- `sql/snowflake/`: Snowflake schema, seed data, and views
- `sql/exercises/`: query practice for the Phase 3 classes
- `sql/workshop/`: source and target tables for reconciliation practice
- `notebooks/`: Python plus SQL notebook
- `presentations/`: PowerPoint decks for the theory sections

## Recommended Teaching Order

1. Use the SQL foundations presentation for Classes 17-21 and 23.
2. Start the local database lab with Docker.
3. Connect to MySQL and PostgreSQL from DBeaver.
4. Load the schema and seed data.
5. Work through the SQL exercise files.
6. Use the warehouse presentation for Redshift and Snowflake concepts.
7. Create a Snowflake trial account and run the Snowflake SQL scripts.
8. Use the Python plus SQL notebook to connect from Jupyter.
9. Finish with the workshop reconciliation scripts.

## Local Database Credentials

These credentials are for local Docker practice only.

| Database | Host | Port | Database | User | Password |
|---|---|---:|---|---|---|
| MySQL | `localhost` | `3306` | `retail_dw` | `student` | `student_password` |
| PostgreSQL | `localhost` | `5432` | `retail_dw` | `student` | `student_password` |

## Cloud Practice

- Snowflake is the hands-on cloud warehouse for this phase.
- Redshift is conceptual only for now. The student can learn the UI and account concepts, but should not run hands-on Redshift labs yet.

