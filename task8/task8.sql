-- TASK 8: STORED PROCEDURES AND FUNCTIONS

-- 1. CREATE A FUNCTION: Calculate order total with discount
CREATE OR REPLACE FUNCTION calculate_discounted_total(p_order_id INT, discount_percent NUMERIC)
RETURNS NUMERIC AS $$
DECLARE
    original_total NUMERIC;
    discounted_total NUMERIC;
BEGIN
    SELECT total_amount INTO original_total
    FROM orders
    WHERE orders.order_id = p_order_id;

    discounted_total := original_total * (1 - discount_percent / 100);
    RETURN ROUND(discounted_total, 2);
END;
$$ LANGUAGE plpgsql;
-- Test the function
SELECT calculate_discounted_total(1, 10);

-- 2. CREATE A PROCEDURE: Update product price with logging
CREATE OR REPLACE PROCEDURE update_product_price(
    product_id INT,
    new_price NUMERIC,
    OUT old_price NUMERIC,
    OUT status TEXT
)
AS $$
BEGIN
    -- Get current price
    SELECT price INTO old_price
    FROM products
    WHERE products.product_id = update_product_price.product_id;
    
    -- Update price
    UPDATE products
    SET price = new_price
    WHERE products.product_id = update_product_price.product_id;
    
    -- Set status
    IF FOUND THEN
        status := 'Price updated successfully';
    ELSE
        status := 'Product not found';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Call the procedure
CALL update_product_price(1, 850.00, NULL, NULL);

-- Verify the update
SELECT * FROM products WHERE product_id = 1;

-- 3. TABLE-RETURNING FUNCTION: Get customer orders
CREATE OR REPLACE FUNCTION get_customer_orders(customer_id INT)
RETURNS TABLE (
    order_id INT,
    order_date TIMESTAMP,
    total_amount NUMERIC,
    status TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT o.order_id, o.order_date, o.total_amount, o.status
    FROM orders o
    WHERE o.customer_id = get_customer_orders.customer_id;
END;
$$ LANGUAGE plpgsql;

-- Test the function
SELECT * FROM get_customer_orders(1);

-- 4. PROCEDURE WITH CONDITIONAL LOGIC: Process order
CREATE OR REPLACE PROCEDURE process_order(
    order_id INT,
    new_status TEXT
)
AS $$
DECLARE
    current_status TEXT;
BEGIN
    -- Get current status
    SELECT status INTO current_status
    FROM orders
    WHERE orders.order_id = process_order.order_id;
    
    -- Validate status transition
    IF current_status = 'cancelled' THEN
        RAISE EXCEPTION 'Cannot process cancelled order';
    ELSIF new_status NOT IN ('processing', 'shipped', 'delivered') THEN
        RAISE EXCEPTION 'Invalid status specified';
    ELSE
        UPDATE orders
        SET status = new_status
        WHERE orders.order_id = process_order.order_id;
        
        RAISE NOTICE 'Order % status changed from % to %', 
            order_id, current_status, new_status;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Test valid transition
CALL process_order(2, 'processing');

-- Test invalid transition (will error)
-- CALL process_order(4, 'invalid_status');