# 1. Add a wallet_balance column to customers. Write a transaction that transfers ₹5,000 from one customer to another - debit one, credit the other, COMMIT only if both succeed.

alter table customers
add wallet_balance decimal(10,2)
default 10000;

select * from customers;

update customers set wallet_balance = 10000;

start transaction;

UPDATE customers
SET wallet_balance=wallet_balance-5000
WHERE customer_id=1;

UPDATE customers
SET wallet_balance=wallet_balance+5000
WHERE customer_id=2;

COMMIT;


# 2. Run the same transfer but force a failure midway (invalid customer id / CHECK violation). Prove ROLLBACK leaves both balances untouched.

START TRANSACTION;

UPDATE customers
SET wallet_balance=wallet_balance-5000
WHERE customer_id=1;

UPDATE customers
SET wallet_balance=wallet_balance+5000
WHERE customer_id=995;

SELECT customer_id,
wallet_balance
FROM customers
WHERE customer_id=1;

ROLLBACK;


# 3. Place an order end-to-end inside one transaction: INSERT into orders, INSERT into order_items, decrement inventory, INSERT into payments. Roll the whole thing back if stock is insufficient.


SELECT p.product_id,
       p.product_name,
       i.quantity
FROM products p
JOIN inventory i
ON p.product_id = i.product_id
WHERE p.product_id = 1;

START TRANSACTION;

INSERT INTO orders (
customer_id, order_date, order_status, total_amount )
VALUES (1, NOW(), 'PENDING', 110000 );

SELECT LAST_INSERT_ID();

INSERT INTO order_items (
order_id, product_id, quantity, unit_price , subtotal)
VALUES ( 10, 1, 2, 55000 ,110000);

select * from order_items;
select * from products;
select * from inventory;

UPDATE inventory
SET quantity = quantity - 2
WHERE product_id = 1;

INSERT INTO payments(
order_id,payment_date,payment_method,payment_status,amount)
VALUES (10,NOW(),'UPI','Completed',110000);

COMMIT;

select * from payments;


# 4. Use SAVEPOINT to insert three order_items, roll back only the third, and COMMIT the first two.

START TRANSACTION;

INSERT INTO order_items
(
order_id,
product_id,
quantity,
unit_price,
subtotal
)
VALUES
(101,95,1,245000,245000);

SAVEPOINT item1;

INSERT INTO order_items
(
order_id,
product_id,
quantity,
unit_price,
subtotal
)
VALUES
(102,96,1,255000,255000);

SAVEPOINT item2;

INSERT INTO order_items
(
order_id,
product_id,
quantity,
unit_price,
subtotal
)
VALUES
(102,105,1,255000,255000);

ROLLBACK TO SAVEPOINT item2;

select * from order_items;

COMMIT;


# 5. 



SELECT @@autocommit;

SET autocommit = 0;

UPDATE products
SET price = 61000
WHERE product_id = 1;

select * from products;

START TRANSACTION;

UPDATE products
SET price = 65000
WHERE product_id = 1;

CREATE TABLE demo (
id INT
);

select * from demo;



# 6. 

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SET autocommit = 0;

START TRANSACTION;

UPDATE products
SET price = 99999
WHERE product_id = 1;

ROLLBACK;


# 7. 

START TRANSACTION;

UPDATE products
SET price = 70000
WHERE product_id = 1;

COMMIT;

UPDATE products
SET price = 71000
WHERE product_id = 1;

COMMIT;


# 8. 

INSERT INTO products
(
    category_id,
    supplier_id,
    product_name,
    description,
    price,
    gst_percentage
)
VALUES
(2,100,'Sony VAIO Pro','Business Laptop',69000,18);

commit;


# 10. 

START TRANSACTION;

SELECT *
FROM products
WHERE product_id = 1
FOR UPDATE;


SELECT *
FROM products
WHERE product_id = 2
FOR UPDATE;


# 11. 

START TRANSACTION;

SELECT *
FROM products
WHERE product_id=1
FOR UPDATE;

SELECT *
FROM products
WHERE product_id=2
FOR UPDATE;


# 12. 

UPDATE inventory
SET quantity=1
WHERE product_id=1;


START TRANSACTION;

SELECT quantity
FROM inventory
WHERE product_id=1;


UPDATE inventory
SET quantity=0
WHERE product_id=1;

COMMIT;

START TRANSACTION;

SELECT quantity
FROM inventory
WHERE product_id=1
FOR UPDATE;

UPDATE inventory
SET quantity=quantity-1
WHERE product_id=1;

COMMIT;


# 13. 

ALTER TABLE inventory
ADD version INT DEFAULT 1;

select * from inventory;

SELECT quantity, version
FROM inventory
WHERE product_id=1;


UPDATE inventory
SET quantity=9,
    version=2
WHERE product_id=1
AND version=1;

commit;

# 14. 

ALTER TABLE products
ADD CONSTRAINT chk_product_price
CHECK (price > 0);

UPDATE products
SET price = -500
WHERE product_id = 1;

ALTER TABLE inventory
ADD CONSTRAINT chk_inventory_quantity
CHECK (quantity >= 0);

UPDATE inventory
SET quantity = -10
WHERE product_id = 1;

UPDATE orders
SET order_status='PAID'
WHERE order_id=1;


# 15. 

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY(order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE;

DELETE FROM orders
WHERE order_id=101;

select * from orders;
select * from order_items;


# 18 . 

CREATE TABLE daily_sales_summary
(
sale_date DATE,
category VARCHAR(100),
total_orders INT,
total_quantity INT,
total_sales DECIMAL(12,2)
);



# 19.  

INSERT INTO inventory(product_id, quantity)
VALUES (1, 5)
ON DUPLICATE KEY UPDATE
quantity = quantity + VALUES(quantity);

select * from products;

commit;

INSERT INTO inventory(product_id, quantity)
VALUES (2, 50)
ON DUPLICATE KEY UPDATE
quantity = quantity + VALUES(quantity);



# 20. 

SELECT
c.category_name,

SUM(CASE WHEN MONTH(o.order_date)=1
THEN oi.quantity*oi.unit_price
ELSE 0 END) AS Jan,

SUM(CASE WHEN MONTH(o.order_date)=2
THEN oi.quantity*oi.unit_price
ELSE 0 END) AS Feb,

SUM(CASE WHEN MONTH(o.order_date)=3
THEN oi.quantity*oi.unit_price
ELSE 0 END) AS Mar

FROM categories c

JOIN products p
ON c.category_id=p.category_id

JOIN order_items oi
ON p.product_id=oi.product_id

JOIN orders o
ON oi.order_id=o.order_id

GROUP BY c.category_name;
















