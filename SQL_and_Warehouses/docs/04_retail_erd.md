# Retail Warehouse ER Diagram

This diagram is the core model for the Phase 3 SQL labs.

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : appears_in
    ORDERS ||--o{ PAYMENTS : receives

    CUSTOMERS {
        int customer_id PK
        string customer_name
        string email
        string segment
        string city
        string state
        string country
        date signup_date
    }

    PRODUCTS {
        int product_id PK
        string product_name
        string category
        decimal unit_price
        boolean active_flag
    }

    ORDERS {
        int order_id PK
        int customer_id FK
        timestamp order_ts
        string order_status
        string channel
        string currency
        timestamp created_at
        timestamp updated_at
    }

    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal unit_price
        decimal discount_amount
    }

    PAYMENTS {
        int payment_id PK
        int order_id FK
        string payment_method
        string payment_status
        decimal paid_amount
        timestamp paid_at
    }
```

## Teaching Notes

- `customers`, `products`, `orders`, `order_items`, and `payments` are normalized tables.
- `orders` depends on `customers`.
- `order_items` resolves the many-to-many relationship between `orders` and `products`.
- `payments` lets us compare operational order status with financial payment status.
- A denormalized reporting view is created later for easier analytics.

