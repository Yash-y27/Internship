# 6. 

Use ecommerce_db;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT product_id, price
FROM products
WHERE product_id = 1;

# 7. Demonstrate a non-repeatable read under READ COMMITTED (same SELECT twice, different answers), then prove REPEATABLE READ prevents it.

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT price
FROM products
WHERE product_id = 1;

# Use REPEATABLE READ.

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT price
FROM products
WHERE product_id = 1;



# 8. 

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT COUNT(*)
FROM products
WHERE price > 50000;

select * from products;


# 10.

START TRANSACTION;

SELECT *
FROM products
WHERE product_id = 2
FOR UPDATE;

SELECT *
FROM products
WHERE product_id = 1
FOR UPDATE;


SHOW ENGINE INNODB STATUS;



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

SELECT quantity
FROM inventory
WHERE product_id=1;


UPDATE inventory
SET quantity=9,
    version=2
WHERE product_id=1
AND version=1










