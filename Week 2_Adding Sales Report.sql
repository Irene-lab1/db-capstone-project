-- Week 2: Task1

ALter VIEW OrderView AS SELECT * FROM littlelemondb.orders where Quantity > 2 ;
select * from OrderView;

-- Week 2: Task2

select c.customerID, FullName, OrderID, TotalCost, MenuName, CourseName 
from OrderView ov 
join littlelemondb.customers c 
on ov.customerID = c.customerID
join littlelemondb.menus m
on ov.MenuID = m.MenuID 
join littlelemondb.menuitems mi
on m.MenuItemsID = mi.MenuItemsID;

-- Week 2: Task3
select 	m.MenuName from littlelemondb.menus m
where MenuID = ANY (select MenuID from littlelemondb.orders group by MenuID having count(MenuID) >= 2);

-------------------------------
-- Create optimized queries to manage and analyze data
-- Task 1

CREATE PROCEDURE GetMaxQuantity()
SELECT max(quantity) MaxOrderQty
From orders;

CALL GetMaxQuantity;


PREPARE GetOrderDetail  From 
'Select OrderID, Quantity, TotalCost From Orders where OrderID =?';

SET @id = 1;
EXECUTE GetOrderDetail  USING @id;


DELIMITER //
CREATE PROCEDURE CancelOrder (IN OD INT)
BEGIN
	SELECT CONCAT("Order ", CONVERT(OrderID, char), " is cancelled") as "Confirmation"
	From orders 
    where OrderID = OD;
END
DELIMITER ;

call CancelOrder (5);
