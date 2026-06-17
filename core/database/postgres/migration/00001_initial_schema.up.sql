CREATE SCHEMA IF NOT EXISTS cercle_test;

CREATE TABLE IF NOT EXISTS cercle_test.users (
    id UUID PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    document_number VARCHAR(20),
    nickname VARCHAR(100),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS cercle_test.retailer (
    id UUID PRIMARY KEY,
    document_number VARCHAR(20) NOT NULL,
    name VARCHAR(255) NOT NULL,
    trade_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS cercle_test.resale_order (
    id UUID PRIMARY KEY,
    fk_retailer_id UUID NOT NULL,
    fk_users_id UUID NOT NULL,
    external_id VARCHAR(100) NOT NULL,
    code VARCHAR(100) NOT NULL,
    date TIMESTAMP NOT NULL,
    current_status VARCHAR(50) NOT NULL,
    delivery_address_zip_code VARCHAR(20),
    delivery_address_street VARCHAR(255),
    delivery_address_number VARCHAR(20),
    delivery_address_district VARCHAR(100),
    delivery_address_city VARCHAR(100),
    delivery_address_state VARCHAR(10),
    delivery_address_country VARCHAR(10),
    delivery_address_receiver_name VARCHAR(255),
    payment_status VARCHAR(50),
    amount_subtotal NUMERIC(12,2) NOT NULL DEFAULT 0,
    amount_freight NUMERIC(12,2) NOT NULL DEFAULT 0,
    amount_interest NUMERIC(12,2) NOT NULL DEFAULT 0,
    amount_total NUMERIC(12,2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP NULL,
    CONSTRAINT fk_resale_order_retailer
        FOREIGN KEY (fk_retailer_id) REFERENCES cercle_test.retailer (id),
    CONSTRAINT fk_resale_order_users
        FOREIGN KEY (fk_users_id) REFERENCES cercle_test.users (id)
);

CREATE TABLE IF NOT EXISTS cercle_test.resale_order_item (
    id UUID PRIMARY KEY,
    fk_resale_order_id UUID NOT NULL,
    sku VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    amount_value NUMERIC(12,2) NOT NULL DEFAULT 0,
    shipping_code VARCHAR(100),
    shipping_status VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMP NULL,
    CONSTRAINT fk_resale_order_item_resale_order
        FOREIGN KEY (fk_resale_order_id) REFERENCES cercle_test.resale_order (id)
);

CREATE INDEX IF NOT EXISTS idx_users_document_number
    ON cercle_test.users (document_number);

CREATE INDEX IF NOT EXISTS idx_resale_order_fk_users_id
    ON cercle_test.resale_order (fk_users_id);

CREATE INDEX IF NOT EXISTS idx_resale_order_fk_retailer_id
    ON cercle_test.resale_order (fk_retailer_id);
  
CREATE INDEX IF NOT EXISTS idx_retailer_deleted_at
    ON cercle_test.retailer (deleted_at);

CREATE UNIQUE INDEX IF NOT EXISTS idx_retailer_document_number_unique
    ON cercle_test.retailer (document_number)
    WHERE deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_resale_order_deleted_at
    ON cercle_test.resale_order (deleted_at);

CREATE INDEX IF NOT EXISTS idx_resale_order_item_deleted_at
    ON cercle_test.resale_order_item (deleted_at);

CREATE INDEX IF NOT EXISTS idx_resale_order_item_fk_resale_order_id
    ON cercle_test.resale_order_item (fk_resale_order_id);
