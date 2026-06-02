# Data Engineering And Data Science Course Program

This course starts with the practical data engineering skills needed to support real batch, warehouse, validation, and orchestration work. After that foundation, it moves into streaming, CDC, Airflow, visualization, and data science.

## Phase 0: Orientation And Setup

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 1 | Data engineering map | Data roles, batch vs streaming, data warehouses, ETL/ELT, data quality, day-to-day data work | Slides + discussion | Student can explain the course roadmap and main tools |
| 2 | Local setup | Python, Jupyter, VSCode, terminal, virtual environments, Colab fallback | Guided setup | Working local environment |
| 3 | Git and terminal workflow | `cd`, `ls`, `pwd`, `mkdir`, `cp`, `mv`, `git status`, commits, branches, GitHub basics | Terminal lab | First committed notebook |

## Phase 1: Python For Notebooks And Job Scripts

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 4 | First Python program | Variables, types, expressions, print/debugging habits | Notebook | Python fundamentals notebook |
| 5 | Data structures | Strings, lists, tuples, dictionaries, nested data | Notebook | Data structures notebook |
| 6 | Control flow | Conditionals, loops, list iteration, validation-style checks | Notebook | Loops and conditionals notebook |
| 7 | Functions | Functions, arguments, returns, docstrings, reusable validation logic | Notebook | Functions notebook |
| 8 | Files and formats | `open`, CSV, JSON, JSONL, YAML, config files, paths | Notebook | Files and formats notebook |
| 9 | Objects and scripts | Classes, modules, exceptions, command-line script basics | Notebook + `.py` script | Small reusable validation helper |

## Phase 2: Pandas For Data Quality Validations

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 10 | Pandas intro | DataFrames, Series, loading and saving CSV | Notebook | Pandas intro notebook |
| 11 | Selection and exploration | `info`, `describe`, `value_counts`, filtering, indexing | Notebook | Exploration notebook |
| 12 | Cleaning | Missing values, formatting, normalization, type conversion | Notebook | Cleaning notebook |
| 13 | Transformations | Derived columns, dummy variables, mapping, basic feature engineering | Notebook | Transformation notebook |
| 14 | Aggregations and reconciliation | `groupby`, joins/merge, summary checks, source vs target comparison | Notebook | Pandas reconciliation notebook |
| 15 | Data quality validation patterns | Null checks, uniqueness checks, ranges, accepted values, schema drift, validation reports | Notebook | Validation report notebook |
| 16 | Workshop | Build a validation notebook for a realistic dataset | Project notebook | First practical DQ notebook |

## Phase 3: SQL And Warehouse Workflows

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 17 | Relational databases | Tables, primary keys, foreign keys, ER diagrams, normalized vs denormalized data | Notebook + diagram | Simple schema diagram |
| 18 | SQL basics | `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, aliases, expressions | SQL lab | Basic query pack |
| 19 | SQL aggregations | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` | SQL lab | Aggregation query pack |
| 20 | Joins and subqueries | Inner/left joins, anti-joins, subqueries, CTEs | SQL lab | Join query pack |
| 21 | Analytical SQL | Window functions, deduplication, ranking, date logic | SQL lab | Practical warehouse query |
| 22 | Redshift and Snowflake concepts | Schemas, warehouses/clusters, permissions, query history, cost awareness, result caching | GUI lab | Student can navigate Snowflake/Redshift-style UI |
| 23 | SQL data quality | Duplicate checks, referential checks, freshness checks, reconciliation queries | SQL lab | SQL validation query pack |
| 24 | Python plus SQL | Connecting from notebooks, parameterized queries, exporting results, safe credentials practice | Notebook | Notebook that runs SQL and produces a report |
| 25 | Workshop | Warehouse-style analysis and validation | Project | SQL plus pandas validation project |

## Phase 4: Batch Jobs, YAML, Harmony Concepts, And Spark

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 26 | Batch orchestration concepts | Jobs, schedules, dependencies, retries, parameters, backfills, logs, alerts | Diagram + discussion | Student can explain a batch job flow |
| 27 | Harmony-style job anatomy | Job metadata, runtime parameters, environment, secrets, scripts, SQL tasks, Spark tasks | Config review | Sanitized Harmony-style job example |
| 28 | YAML for data jobs | YAML syntax, nested config, validation, parsing YAML in Python | Notebook + config file | YAML config notebook |
| 29 | SQL batch task | Idempotency, date parameters, partitions, reruns, temp tables, logging | SQL + script lab | Parameterized SQL task |
| 30 | Spark concepts | Distributed processing, DataFrames, Spark SQL, partitioning, when Spark helps | Notebook or slides | Student can explain Spark vs pandas |
| 31 | PySpark basics | Read, transform, write, joins, aggregations, partitioned output | Notebook | Local PySpark notebook |
| 32 | Standardized Spark ETLs | Config-driven ETLs, expected inputs/outputs, schema handling, failure modes | Lab | YAML-driven Spark job example |
| 33 | Workshop | End-to-end batch pipeline | Project | Harmony-style YAML, SQL/Spark task, and DQ notebook |

## Phase 5: CDC, Kafka, Airflow, And Snowflake Loading

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 34 | Docker for data engineers | Images, containers, volumes, ports, compose files, logs | Docker lab | Run a local service with Docker Compose |
| 35 | MySQL source systems | Tables, transactions, primary keys, binlog/change event idea | SQL + Docker lab | Local MySQL database with sample table |
| 36 | Kafka basics | Topics, partitions, offsets, producers, consumers, consumer groups | Docker + CLI lab | Produce and consume sample events |
| 37 | CDC connector concepts | Snapshot vs streaming, inserts, updates, deletes, schemas, offsets, error handling | Diagram + lab | Student can explain CDC event flow |
| 38 | Debezium-style connector lab | MySQL to Kafka CDC, mapped to internal connector concepts when needed | Docker lab | MySQL changes appearing as Kafka events |
| 39 | Snowflake connector concepts | Kafka to Snowflake, staging, target tables, schema evolution, load errors | GUI + config lab | Snowflake connector configuration walkthrough |
| 40 | Airflow basics | DAGs, tasks, operators, schedules, retries, connections, variables, XComs | Notebook/slides + UI | First Airflow DAG |
| 41 | Airflow with Docker | Local Airflow, DAG folder, logs, reruns, task failures | Docker lab | DAG that runs a SQL or Python validation |
| 42 | Operations and monitoring | Logs, retries, SLAs, alerts, incident notes, debugging mindset | Case study | Troubleshooting checklist |
| 43 | Workshop | Mini CDC project | Project | MySQL changes to Kafka to target table/checks, with Airflow validation |

## Phase 6: Visualization And Business Delivery

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 44 | Python visualization | Matplotlib, Seaborn, chart selection | Notebook | Visualization notebook |
| 45 | Storytelling with data | Trends, comparisons, outliers, explaining data quality issues | Notebook | Short narrative analysis |
| 46 | Tableau basics | Setup, connect data, charts, calculated fields | GUI lab | First Tableau workbook |
| 47 | Tableau dashboards | Filters, parameters, dashboard layout, stakeholder view | GUI lab | Dashboard from validation or warehouse data |
| 48 | Workshop | Data storytelling project | Project | Dashboard plus written findings |

## Phase 7: Data Science, Audio, LLMs, And Cloud

| Class | Focus | Topics | Format | Output |
|---|---|---|---|---|
| 49 | Statistics foundations | Central tendency, dispersion, distributions | Notebook | Stats summary notebook |
| 50 | Statistical testing | Correlation, ANOVA, hypothesis testing | Notebook | Hypothesis test notebook |
| 51 | Machine learning intro | Supervised vs unsupervised, train/test split, metrics | Notebook | First scikit-learn model |
| 52 | Regression | Linear regression, multiple regression, validation, cross-validation | Notebook | Regression project |
| 53 | Feature selection | Dimensionality reduction, PCA, leakage awareness | Notebook | Feature engineering/modeling notebook |
| 54 | Audio basics | Reading/writing audio, waveform, sampling rate | Notebook | Audio loading notebook |
| 55 | Audio ML | MFCC, chroma, tempo, genre classification, clustering | Notebook | Audio ML mini project |
| 56 | Deep learning and LLMs | Neural networks, text/audio examples, what LLMs are, how ChatGPT-style tools work | Notebook/slides | Conceptual demo |
| 57 | Cloud and careers | GCP or cloud concepts, deployments, certifications, portfolio, Q&A | Discussion | Learning plan and capstone prep |
| 58 | Capstone presentations | Present the final project and reflect on job-ready skills | Presentation | Final capstone |

## Projects

| Project | Timing | Goal | Deliverable |
|---|---|---|---|
| Project 1 | After Class 9 | Use Python to read files and validate simple rules | Python script plus notebook |
| Project 2 | After Class 16 | Build a pandas DQ validation notebook | Validation report notebook |
| Project 3 | After Class 25 | Query warehouse-style tables and reconcile results | SQL pack plus pandas report |
| Project 4 | After Class 33 | Build a Harmony-style batch job package | YAML config, SQL/Spark task, validation notebook |
| Project 5 | After Class 43 | Build a local CDC flow | Docker lab, source changes, target checks |
| Project 6 | After Class 48 | Explain findings to a stakeholder | Tableau or Python dashboard |
| Capstone | End | Combine engineering plus analytics | End-to-end project presentation |

## Class Rhythm

1. Review the previous commit or homework.
2. Explain the concept using a real work scenario.
3. Build together in a notebook, SQL editor, terminal, or UI.
4. Give the student a small independent task.
5. Commit the result to GitHub.
6. End with two debugging questions: "What failed?" and "How did we prove it worked?"

