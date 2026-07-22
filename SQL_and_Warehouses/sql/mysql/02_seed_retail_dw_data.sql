USE retail_dw;

INSERT INTO customers (
    customer_id, customer_name, email, segment, city, state, country, signup_date
) VALUES
    (1, 'Ana Rivera', 'ana@example.com', 'Retail', 'Bogota', 'Cundinamarca', 'Colombia', '2025-12-15'),
    (2, 'Luis Gomez', 'luis@example.com', 'Corporate', 'Medellin', 'Antioquia', 'Colombia', '2026-01-10'),
    (3, 'Sofia Patel', 'sofia@example.com', 'Retail', 'Miami', 'Florida', 'United States', '2026-01-18'),
    (4, 'Marta Chen', 'marta@example.com', 'Home Office', 'Orlando', 'Florida', 'United States', '2026-02-03'),
    (5, 'John Smith', 'john@example.com', 'Corporate', 'New York', 'New York', 'United States', '2026-02-20'),
    (6, 'Camilo Torres', 'camilo@example.com', 'Retail', 'Cali', 'Valle del Cauca', 'Colombia', '2026-03-04'),
    (7, 'Priya Shah', 'priya@example.com', 'Home Office', 'London', 'England', 'United Kingdom', '2026-03-15'),
    (8, 'Diego Lopez', 'diego@example.com', 'Retail', 'Mexico City', 'CDMX', 'Mexico', '2026-04-02');

INSERT INTO products (
    product_id, product_name, category, unit_price, active_flag
) VALUES
    (101, 'Wireless Mouse', 'Technology', 25.00, TRUE),
    (102, 'Mechanical Keyboard', 'Technology', 85.00, TRUE),
    (103, 'Desk Lamp', 'Home Office', 45.00, TRUE),
    (104, 'Notebook Pack', 'Stationery', 12.00, TRUE),
    (105, 'Monitor 24 Inch', 'Technology', 220.00, TRUE),
    (106, 'Headphones', 'Technology', 65.00, TRUE),
    (107, 'USB-C Hub', 'Technology', 40.00, TRUE),
    (108, 'Coffee Mug', 'Home Office', 15.00, TRUE);

INSERT INTO orders (
    order_id, customer_id, order_ts, order_status, channel, currency, created_at, updated_at
) VALUES
    (1001, 1, '2026-07-01 09:15:00', 'complete', 'web', 'USD', '2026-07-01 09:15:00', '2026-07-01 09:30:00'),
    (1002, 2, '2026-07-02 10:05:00', 'complete', 'store', 'USD', '2026-07-02 10:05:00', '2026-07-02 10:25:00'),
    (1003, 3, '2026-07-03 12:45:00', 'refunded', 'web', 'USD', '2026-07-03 12:45:00', '2026-07-04 08:00:00'),
    (1004, 4, '2026-07-03 14:10:00', 'complete', 'marketplace', 'USD', '2026-07-03 14:10:00', '2026-07-03 14:30:00'),
    (1005, 5, '2026-07-04 15:00:00', 'cancelled', 'web', 'USD', '2026-07-04 15:00:00', '2026-07-04 15:20:00'),
    (1006, 1, '2026-07-05 09:40:00', 'complete', 'web', 'USD', '2026-07-05 09:40:00', '2026-07-05 09:55:00'),
    (1007, 6, '2026-07-05 11:30:00', 'complete', 'store', 'USD', '2026-07-05 11:30:00', '2026-07-05 11:45:00'),
    (1008, 7, '2026-07-06 16:20:00', 'complete', 'web', 'USD', '2026-07-06 16:20:00', '2026-07-06 16:35:00'),
    (1009, 8, '2026-07-06 18:05:00', 'pending', 'marketplace', 'USD', '2026-07-06 18:05:00', '2026-07-06 18:10:00'),
    (1010, 3, '2026-07-07 08:50:00', 'complete', 'web', 'USD', '2026-07-07 08:50:00', '2026-07-07 09:10:00'),
    (1011, 2, '2026-07-08 13:15:00', 'complete', 'store', 'USD', '2026-07-08 13:15:00', '2026-07-08 13:45:00'),
    (1012, 4, '2026-07-08 17:25:00', 'complete', 'web', 'USD', '2026-07-08 17:25:00', '2026-07-08 17:40:00');

INSERT INTO order_items (
    order_item_id, order_id, product_id, quantity, unit_price, discount_amount
) VALUES
    (5001, 1001, 101, 2, 25.00, 0.00),
    (5002, 1001, 104, 1, 12.00, 2.00),
    (5003, 1002, 102, 1, 85.00, 10.00),
    (5004, 1003, 105, 1, 220.00, 20.00),
    (5005, 1004, 103, 1, 45.00, 0.00),
    (5006, 1004, 108, 2, 15.00, 0.00),
    (5007, 1005, 106, 1, 65.00, 65.00),
    (5008, 1006, 105, 1, 220.00, 0.00),
    (5009, 1006, 107, 1, 40.00, 0.00),
    (5010, 1007, 104, 3, 12.00, 0.00),
    (5011, 1008, 103, 2, 45.00, 5.00),
    (5012, 1009, 108, 1, 15.00, 0.00),
    (5013, 1010, 106, 2, 65.00, 10.00),
    (5014, 1010, 104, 1, 12.00, 0.00),
    (5015, 1011, 102, 1, 85.00, 0.00),
    (5016, 1012, 101, 1, 25.00, 0.00),
    (5017, 1012, 107, 2, 40.00, 5.00);

INSERT INTO payments (
    payment_id, order_id, payment_method, payment_status, paid_amount, paid_at
) VALUES
    (9001, 1001, 'card', 'settled', 60.00, '2026-07-01 09:31:00'),
    (9002, 1002, 'card', 'settled', 75.00, '2026-07-02 10:26:00'),
    (9003, 1003, 'card', 'refunded', 200.00, '2026-07-04 08:01:00'),
    (9004, 1004, 'wallet', 'settled', 75.00, '2026-07-03 14:31:00'),
    (9005, 1005, 'card', 'voided', 0.00, NULL),
    (9006, 1006, 'card', 'settled', 260.00, '2026-07-05 09:56:00'),
    (9007, 1007, 'cash', 'settled', 36.00, '2026-07-05 11:46:00'),
    (9008, 1008, 'card', 'settled', 85.00, '2026-07-06 16:36:00'),
    (9009, 1009, 'card', 'pending', 15.00, NULL),
    (9010, 1010, 'wallet', 'settled', 132.00, '2026-07-07 09:11:00'),
    (9011, 1011, 'card', 'settled', 85.00, '2026-07-08 13:46:00'),
    (9012, 1012, 'card', 'settled', 100.00, '2026-07-08 17:41:00');

