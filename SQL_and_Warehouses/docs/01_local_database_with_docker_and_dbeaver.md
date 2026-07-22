# Local Database Lab With Docker And DBeaver

This guide helps the student run MySQL and PostgreSQL locally with Docker, then connect to both databases using DBeaver.

## Prerequisites

- Docker Desktop installed and running
- DBeaver installed
- Terminal access
- This repository cloned locally

## Start The Databases

From the repository root:

```bash
cd SQL_and_Warehouses/docker
cp .env.example .env
docker compose up -d
docker compose ps
```

The first startup can take a few minutes because Docker needs to download the database images and initialize the data directories.

The Docker Compose file uses the official MySQL and PostgreSQL images. Their initialization scripts run only when the database volume is empty.

## Stop The Databases

```bash
cd SQL_and_Warehouses/docker
docker compose stop
```

## Start Them Again

```bash
cd SQL_and_Warehouses/docker
docker compose up -d
```

## Reset The Lab Data

Only do this when you want to delete the local database volumes and start from scratch:

```bash
cd SQL_and_Warehouses/docker
docker compose down -v
docker compose up -d
```

## DBeaver Connection: MySQL

Create a new database connection in DBeaver and select the MySQL driver.

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `3306` |
| Database | `retail_dw` |
| Username | `student` |
| Password | `student_password` |

Click **Test Connection**, download the driver if DBeaver asks, then click **Finish**.

## DBeaver Connection: PostgreSQL

Create a new database connection in DBeaver and select the PostgreSQL driver.

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `5432` |
| Database | `retail_dw` |
| Username | `student` |
| Password | `student_password` |

Click **Test Connection**, download the driver if DBeaver asks, then click **Finish**.

For the PostgreSQL scripts in this module, run this before exercises if the `retail` schema is not selected by default:

```sql
SET search_path TO retail;
```

## Quick Smoke Tests

MySQL:

```sql
USE retail_dw;

SELECT COUNT(*) AS customer_count
FROM customers;
```

PostgreSQL:

```sql
SET search_path TO retail;

SELECT COUNT(*) AS customer_count
FROM customers;
```

## Troubleshooting

- If DBeaver cannot connect, check that Docker Desktop is running.
- If ports are already in use, another local MySQL or PostgreSQL service may already be running.
- If tables do not appear after editing SQL init files, reset the volumes with `docker compose down -v`.
- If the DBeaver driver is missing, accept the prompt to download it.

## References

- DBeaver connection wizard: https://dbeaver.com/docs/dbeaver/Create-Connection/
- MySQL Docker image: https://hub.docker.com/_/mysql
- PostgreSQL Docker image: https://hub.docker.com/_/postgres

