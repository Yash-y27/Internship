# 1. Create a view that displays all active customers. 

create View active_customers as 

SELECT customer_id, first_name,last_name,email,phone,status,created_at
FROM customers
WHERE status = 'Active'
AND is_active = TRUE;

SELECT * FROM active_customers;


# 2. Create a view showing monthly sales summary. 

CREATE VIEW monthly_sales_summary AS
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount),2) AS average_order_value
FROM orders
WHERE is_deleted = FALSE
GROUP BY
    YEAR(order_date),
    MONTH(order_date); 
    
    
SELECT * FROM monthly_sales_summary;


# 3. Create a view displaying top-selling products.

CREATE VIEW top_selling_products AS
SELECT
    p.product_id, p.product_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity DESC;

SELECT * FROM top_selling_products;


# 4. Create a view showing customer order history.

CREATE VIEW customer_order_history AS
SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id	
WHERE o.is_deleted=FALSE;

SELECT * FROM customer_order_history;


# 5. Create a view showing products with low stock.

CREATE VIEW low_stock_products AS
SELECT p.product_id, p.product_name, i.quantity, i.location
FROM products p
JOIN inventory i
ON p.product_id=i.product_id
WHERE i.quantity<10;

SELECT * FROM low_stock_products;

# ----------------------------------------------------------------------------------

# view commands 

SHOW FULL TABLES WHERE Table_type='VIEW';   # show all the views

# Alter View ( you want to add the customer's phone number. )

ALTER VIEW vw_active_customers AS       
SELECT customer_id,first_name,last_name,email,phone,status
FROM customers WHERE status='Active';

# Drop View 

DROP VIEW active_customers;


# -------------------------------------------------------------------------------------------

# 6. Create an index on customers(phone) and compare query execution before and after.

CREATE INDEX idx_customer_phone ON customers(phone);

# 7. Create a composite index on (customer_id, order_date). 

CREATE INDEX idx_customer_orderdate ON orders(customer_id, order_date);

# 8. Find three slow queries and optimize them using indexes.

SHOW INDEX FROM customers;

SHOW INDEX FROM orders;

# 10. Use EXPLAIN on five queries and explain the execution plan. 

# 1. Customer Search 

EXPLAIN
SELECT *
FROM customers
WHERE email='rahul@gmail.com';


# 2. Customer Orders 

EXPLAIN
SELECT *
FROM orders
WHERE customer_id=1;


# 3. Product Search

EXPLAIN
SELECT *
FROM products
WHERE category_id=2;


# 4. Order History

EXPLAIN
SELECT *
FROM orders
WHERE order_date>'2026-03-01';

# 5. Join Query

EXPLAIN
SELECT
c.first_name,
o.order_id,
o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id;



# 11. Create a stored procedure to retrieve all orders for a customer. 

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders
(
    IN p_customer_id INT
)
BEGIN

    SELECT
        order_id,
        order_date,
        total_amount,
        order_status
    FROM orders
    WHERE customer_id = p_customer_id;

END $$

DELIMITER ;

CALL GetCustomerOrders(1);


# 12. Create a stored procedure to calculate total sales for a given month .

DELIMITER $$

CREATE PROCEDURE GetMonthlySales
(
    IN p_year INT,
    IN p_month INT
)
BEGIN

    SELECT

        SUM(total_amount) AS TotalSales

    FROM orders

    WHERE YEAR(order_date)=p_year

    AND MONTH(order_date)=p_month;

END $$

DELIMITER ;


# 13. Create a stored procedure that returns the top 10 customers based on spending. 

DELIMITER $$

CREATE PROCEDURE TopCustomers()
BEGIN

SELECT

c.customer_id,
CONCAT(c.first_name,' ',c.last_name) customer_name,
SUM(o.total_amount) total_spending

FROM customers c

JOIN orders o
ON c.customer_id=o.customer_id

GROUP BY c.customer_id, customer_name
ORDER BY total_spending DESC

LIMIT 10;

END $$

DELIMITER ;

CALL TopCustomers();



# 14. Create a stored procedure to update product prices by a given percentage.

DELIMITER $$

CREATE PROCEDURE IncreasePrice
(
IN percentage DECIMAL(5,2)
)

BEGIN

UPDATE products
SET price=price+(price*percentage/100);

END $$

DELIMITER ;

CALL IncreasePrice(10);


# 15. Create a stored procedure that applies tiered discounts:
# 5% for orders above ₹5,000 , 10% for orders above ₹10,000 Return the final payable amount

DELIMITER $$

CREATE PROCEDURE CalculateDiscount
(
IN p_order_amount DECIMAL(10,2)
)

BEGIN

DECLARE discount DECIMAL(10,2);

DECLARE final_amount DECIMAL(10,2);

IF p_order_amount>10000 THEN SET discount=10;

ELSEIF p_order_amount>5000 THEN SET discount=5;

ELSE SET discount=0;

END IF;

SET final_amount=p_order_amount - (p_order_amount*discount/100);

SELECT

discount AS DiscountPercent,
final_amount AS FinalAmount;

END $$

DELIMITER ;

CALL CalculateDiscount(12000);


# 16. Create a function to calculate order total including GST.

DELIMITER $$

CREATE FUNCTION CalculateGSTs
(
    amount DECIMAL(10,2),
    gst DECIMAL(5,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN amount + (amount * gst / 100);

END $$

DELIMITER ;

SELECT CalculateGSTs(1000,18);


# 17. Create a function to calculate customer age from date of birth.

DELIMITER $$

CREATE FUNCTION CustomerAge
(
dob DATE
)
RETURNS INT

DETERMINISTIC

BEGIN

RETURN TIMESTAMPDIFF (
YEAR,dob,CURDATE() );

END $$

DELIMITER ;

SELECT first_name, CustomerAge(date_of_birth) Age
FROM customers;

# 18. Create a function that returns the total number of orders for a customer. 

DELIMITER $$

CREATE FUNCTION TotalOrders
(
p_customer_id INT
)

RETURNS INT

READS SQL DATA

BEGIN

DECLARE total INT;

SELECT COUNT(*)
INTO total
FROM orders
WHERE customer_id=p_customer_id;

RETURN total;

END $$

DELIMITER ;

SELECT first_name, TotalOrders(customer_id)
FROM customers;


# 19. Create a function that returns product stock status: In Stock , Low Stock , Out of Stock

DELIMITER $$

CREATE FUNCTION StockStatus
(
qty INT
)

RETURNS VARCHAR(30)

DETERMINISTIC

BEGIN

RETURN

CASE

WHEN qty=0 THEN 'Out of Stock'

WHEN qty<=10 THEN 'Low Stock'

ELSE 'In Stock'

END;

END $$

DELIMITER ;

SELECT product_id, quantity, StockStatus(quantity)
FROM inventory;



# 20. Create a function that calculates total revenue generated by a product. 

DELIMITER $$

CREATE FUNCTION ProductRevenue
(
p_product_id INT
)

RETURNS DECIMAL(12,2)

READS SQL DATA

BEGIN

DECLARE revenue DECIMAL(12,2);

SELECT IFNULL(SUM(subtotal),0)

INTO revenue
FROM order_items
WHERE product_id=p_product_id;

RETURN revenue;

END $$

DELIMITER ;

SELECT product_name, ProductRevenue(product_id) Revenue
FROM products;


# 21. Create a trigger that automatically updates product stock when an order is placed.

DELIMITER $$

CREATE TRIGGER update_inventory

AFTER INSERT ON order_items

FOR EACH ROW

BEGIN

UPDATE inventory

SET quantity=quantity-NEW.quantity

WHERE product_id=NEW.product_id;

END $$

DELIMITER ;


select * from inventory;
select count(*) from inventory;

SELECT * FROM orders;

INSERT INTO order_items
(
order_id,
product_id,
quantity,
unit_price,
subtotal
)
VALUES (9,1,2,61700,124800);


# 22. Create a trigger that records every new order in an audit table. 

DELIMITER $$

CREATE TRIGGER trg_order_insert

AFTER INSERT ON orders

FOR EACH ROW

BEGIN

INSERT INTO order_audit_log (
order_id,
operation_type,
user_name,
new_values )

VALUES ( NEW.order_id, 'INSERT', CURRENT_USER(),
CONCAT('Customer=', NEW.customer_id ,', Amount=', NEW.total_amount ));

END $$

DELIMITER ;

select * from order_audit_log;

INSERT INTO orders (
customer_id,
total_amount) 
VALUES (2,5000);



# 23. Create a trigger that logs old and new prices whenever a product price changes. 

CREATE TABLE product_price_log(

log_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
old_price DECIMAL(10,2),
new_price DECIMAL(10,2),
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER product_price
AFTER UPDATE ON products
FOR EACH ROW

BEGIN

IF OLD.price<>NEW.price THEN

INSERT INTO product_price_log ( product_id,old_price,new_price)
VALUES( NEW.product_id, OLD.price,NEW.price );

END IF;

END $$

DELIMITER ;

select * from products;
select * from product_price_log;

UPDATE products SET price=70000
WHERE product_id=1;


# 24. Create a trigger that prevents negative stock quantities. 

DELIMITER $$

CREATE TRIGGER trg_prevent_negative_stock
BEFORE UPDATE ON inventory
FOR EACH ROW

BEGIN

IF NEW.quantity < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Stock cannot be negative';

END IF;

END $$

DELIMITER ;

UPDATE inventory SET quantity=-5
WHERE product_id=1;



# 25. Create a trigger that records every INSERT, UPDATE, and DELETE on the orders table with: 
# User , Timestamp , Operation Type , Old Values , New Values .

# (1) Insert : 
DELIMITER $$

CREATE TRIGGER trg_orders_insert_audit
AFTER INSERT ON orders
FOR EACH ROW

BEGIN

INSERT INTO order_audit_log (
order_id, operation_type, user_name, new_values
)
VALUES ( NEW.order_id, 'INSERT', CURRENT_USER(),
CONCAT('Customer=',NEW.customer_id,', Amount=',NEW.total_amount,', Status=',NEW.order_status)
);

END $$

DELIMITER ;


# (2) Update :

DELIMITER $$

CREATE TRIGGER trg_orders_update_audit
AFTER UPDATE ON orders
FOR EACH ROW

BEGIN

INSERT INTO order_audit_log(
order_id, operation_type, user_name, old_values, new_values
)

VALUES ( NEW.order_id, 'UPDATE', CURRENT_USER(),
CONCAT ('Amount=',OLD.total_amount,', Status=',OLD.order_status),
CONCAT('Amount=',NEW.total_amount,', Status=',NEW.order_status)
);

END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_orders_delete_audit
AFTER DELETE ON orders
FOR EACH ROW

BEGIN

INSERT INTO order_audit_log (
order_id, operation_type, user_name, old_values )

VALUES ( OLD.order_id, 'DELETE', CURRENT_USER(),
CONCAT ('Customer=',OLD.customer_id, ', Amount=',OLD.total_amount, ', Status=',OLD.order_status));

END $$

DELIMITER ;



# 26. Write a deliberately slow query on a table containing 500+ rows.
# Capture the EXPLAIN output.
# Add the correct index.
# Capture the new EXPLAIN.
# Compare execution cost and explain the improvement.

SELECT *
FROM orders
WHERE total_amount > 30000;    # no index on total_amount

EXPLAIN
SELECT *
FROM orders
WHERE total_amount > 30000;     # Capture EXPLAIN (Before Index) => Every row is checked. (type = ALL)

CREATE INDEX idx_total_amount ON orders(total_amount);     # create index

EXPLAIN
SELECT *
FROM orders
WHERE total_amount > 30000;     # type = range



# 27. Create an order_audit_log table and use triggers to maintain it automatically for every INSERT, UPDATE, and DELETE. 

# Insert 

DELIMITER $$

CREATE TRIGGER orders_insert_audit
AFTER INSERT ON orders
FOR EACH ROW

BEGIN

INSERT INTO order_audit_log
(
    order_id, operation_type, user_name, old_values, new_values
)
VALUES
(
    NEW.order_id, 'INSERT', CURRENT_USER(), NULL,
    CONCAT(
		'Customer ID: ', NEW.customer_id,
        ', Amount: ', NEW.total_amount,
        ', Status: ', NEW.order_status
    )
);

END $$

DELIMITER ;


INSERT INTO orders ( customer_id, total_amount, order_status)
VALUES ( 1, 5000, 'Pending');


# update

DELIMITER $$

CREATE TRIGGER rders_update_audit
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN

INSERT INTO order_audit_log (
    order_id, operation_type, user_name, old_values, new_values
)
VALUES ( NEW.order_id, 'UPDATE', CURRENT_USER(),

    CONCAT(
        'Customer ID: ', OLD.customer_id,
        ', Amount: ', OLD.total_amount,
        ', Status: ', OLD.order_status
    ),

    CONCAT(
        'Customer ID: ', NEW.customer_id,
        ', Amount: ', NEW.total_amount,
        ', Status: ', NEW.order_status
    )
);

END $$

DELIMITER ;

UPDATE orders
SET total_amount = 6500, order_status = 'Confirmed'
WHERE order_id = 10;


# delete

DELIMITER $$

CREATE TRIGGER orders_delete_audit
AFTER DELETE ON orders
FOR EACH ROW
BEGIN

INSERT INTO order_audit_log (
    order_id, operation_type, user_name, old_values, new_values
)
VALUES ( OLD.order_id, 'DELETE', CURRENT_USER(),

    CONCAT(
        'Customer ID: ', OLD.customer_id,
        ', Amount: ', OLD.total_amount,
        ', Status: ', OLD.order_status
    ),

    NULL
);

END $$

DELIMITER ;

DELETE  
FROM orders
WHERE order_id = 9;


SELECT * FROM order_audit_log;

select * from orders;


# 28. Write a stored procedure that:
# Accepts a customer ID.
# Calculates total order value.
# Applies tiered discounts (5% above ₹5,000, 10% above ₹10,000).
# Returns the final amount.

DELIMITER $$

CREATE PROCEDURE GetCustomerFinalBill
(
    IN p_customer_id INT
)
BEGIN

    DECLARE v_total_amount DECIMAL(12,2) DEFAULT 0;
    DECLARE v_discount_percent DECIMAL(5,2) DEFAULT 0;
    DECLARE v_discount_amount DECIMAL(12,2) DEFAULT 0;
    DECLARE v_final_amount DECIMAL(12,2) DEFAULT 0;

    SELECT IFNULL(SUM(total_amount),0)
    INTO v_total_amount
    FROM orders
    WHERE customer_id = p_customer_id
	AND is_deleted = FALSE;

    IF v_total_amount > 10000 THEN SET v_discount_percent = 10;
    ELSEIF v_total_amount > 5000 THEN SET v_discount_percent = 5;
    ELSE SET v_discount_percent = 0;

    END IF;

    SET v_discount_amount = v_total_amount * v_discount_percent / 100;
    SET v_final_amount = v_total_amount - v_discount_amount;

    SELECT
        p_customer_id AS Customer_ID,
        v_total_amount AS Total_Order_Value,
        CONCAT(v_discount_percent,'%') AS Discount,
        v_discount_amount AS Discount_Amount,
        v_final_amount AS Final_Payable_Amount;

END $$

DELIMITER ;


CALL GetCustomerFinalBill(1);


# 29. Prepare an Index Recommendation Report for the e-commerce database including: 
# Table Name , Column(s) , Current Query Performance , Recommended Index Type , Reason for Index , Expected Performance Improvement

# Customers
CREATE UNIQUE INDEX idx_customers_phone
ON customers(phone);

# Orders
CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

CREATE INDEX idx_orders_status
ON orders(order_status);

CREATE INDEX idx_orders_date
ON orders(order_date);

CREATE INDEX idx_orders_total
ON orders(total_amount);

# Products
CREATE INDEX idx_products_category
ON products(category_id);

CREATE INDEX idx_products_supplier
ON products(supplier_id);

CREATE INDEX idx_products_name
ON products(product_name);

# Order Items
CREATE INDEX idx_order_items_order
ON order_items(order_id);

CREATE INDEX idx_order_items_product
ON order_items(product_id);

# Payments
CREATE INDEX idx_payments_order
ON payments(order_id);

CREATE INDEX idx_payments_status
ON payments(payment_status);


EXPLAIN
SELECT *
FROM orders
WHERE total_amount > 10000;






















