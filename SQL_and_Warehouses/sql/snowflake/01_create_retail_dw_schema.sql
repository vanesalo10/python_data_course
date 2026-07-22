CREATE DATABASE IF NOT EXISTS RETAIL_DW;
CREATE SCHEMA IF NOT EXISTS RETAIL_DW.ANALYTICS;

USE DATABASE RETAIL_DW;
USE SCHEMA ANALYTICS;

CREATE OR REPLACE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    country VARCHAR NOT NULL,
    signup_date DATE NOT NULL
);

CREATE OR REPLACE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR NOT NULL,
    category VARCHAR NOT NULL,
    unit_price NUMBER(10, 2) NOT NULL,
    active_flag BOOLEAN NOT NULL
);

CREATE OR REPLACE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    order_ts TIMESTAMP_NTZ NOT NULL,
    order_status VARCHAR NOT NULL,
    channel VARCHAR NOT NULL,
    currency VARCHAR NOT NULL,
    created_at TIMESTAMP_NTZ NOT NULL,
    updated_at TIMESTAMP_NTZ NOT NULL
);

CREATE OR REPLACE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    unit_price NUMBER(10, 2) NOT NULL,
    discount_amount NUMBER(10, 2) NOT NULL
);

CREATE OR REPLACE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    payment_method VARCHAR NOT NULL,
    payment_status VARCHAR NOT NULL,
    paid_amount NUMBER(10, 2) NOT NULL,
    paid_at TIMESTAMP_NTZ
);

