DELIMITER $$

CREATE PROCEDURE p_get_total_order()
BEGIN
    DECLARE totalOrder INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO totalOrder
    FROM orders;
    
    SELECT totalOrder;
END$$

DELIMITER ;

-- Waarom niet SELECT COUNT(*) as totalOrder?