CREATE TABLE 
    public.categories (
        category_id SERIAL PRIMARY KEY,
        category_name VARCHAR(100) NOT NULL);

CREATE TABLE 
    public.customers (
        customer_id SERIAL PRIMARY KEY,
        customer_lname VARCHAR(100) NOT NULL),
        customer_fname VARCHAR(100) NOT NULL);

CREATE TABLE 
    public.manufacturers (
        manufacturer_id SERIAL PRIMARY KEY,
        manufacturer_name VARCHAR(100) NOT NULL);

CREATE TABLE   
    public.stores (
        store_id SERIAL PRIMARY KEY,
        store_name VARCHAR(255) NOT NULL);

CREATE TABLE 
    public.products (
        manufacturer_id BIGINT REFERENCES manufacturers(manufacturer_id),
        category_id BIGINT REFERENCES categories(category_id),
        product_id BIGINT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL);

CREATE TABLE 
    public.deliveries (
        store_id BIGINT REFERENCES stores(store_id),
        product_id BIGINT REFERENCES products(product_id),
        delivery_date DATE NOT NULL,
        product_count INTEGER NOT NULL);

CREATE TABLE 
    public.purchases (
        store_id BIGINT REFERENCES stores(store_id),
        customer_id BIGINT REFERENCES customers(customer_id),
        purchase_id SERIAL PRIMARY KEY,
        purchase_date DATE);

CREATE TABLE
    public.purchase_items (
        product_id BIGINT REFERENCES products(product_id),
        purchase_id BIGINT REFERENCES purchases(purchase_id),
        product_price NUMERIC(9,2) NOT NULL,
        product_count BIGINT NOT NULL);

CREATE TABLE
    public.price_change (
        product_id BIGINT PRIMARY KEY REFERENCES products(product_id),
        price_change_ts TIMESTAMP NOT NULL,
        new_price NUMERIC(9,2) NOT NULL)