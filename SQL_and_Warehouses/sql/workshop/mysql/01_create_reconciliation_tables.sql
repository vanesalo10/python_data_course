USE retail_dw;

DROP TABLE IF EXISTS workshop_orders;

CREATE TABLE workshop_orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    gross_amount DECIMAL(10, 2) NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    net_amount DECIMAL(10, 2) NOT NULL,
    updated_at DATETIME NOT NULL
);

