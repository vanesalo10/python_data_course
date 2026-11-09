"""Connection parameters for 04_python_plus_sql_connections.ipynb.

MySQL and PostgreSQL use the course Docker settings below. Replace the
Snowflake YOUR_... placeholders, save this file, and restart the notebook
kernel before importing again. Keep real passwords local; do not commit them.
"""

# Connection string format: driver://username:password@host:port/database
# These are the local practice credentials from the course Docker setup.
# Edit the strings if your host, port, database, username, or password differs.
MYSQL_URL = "mysql+pymysql://student:student_password@localhost:3306/retail_dw"

POSTGRES_URL = "postgresql+psycopg2://student:student_password@localhost:5432/retail_dw"

# Snowflake: these keys are passed to snowflake.connector.connect().
SNOWFLAKE_PARAMS = {
    "account": "YOUR_SNOWFLAKE_ACCOUNT",  # org-account; omit .snowflakecomputing.com
    "user": "YOUR_SNOWFLAKE_USER",  # Your Snowflake login name.
    "password": "YOUR_SNOWFLAKE_PASSWORD",  # Your Snowflake password.
    "warehouse": "YOUR_SNOWFLAKE_WAREHOUSE",  # Name of your compute warehouse.
    "database": "RETAIL_DW",  # Database created by the course setup scripts.
    "schema": "ANALYTICS",  # Schema created by the course setup scripts.
    "role": None,  # Replace with a role name if needed; None uses your default role.
}
