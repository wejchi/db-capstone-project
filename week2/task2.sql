SELECT Customers.id AS customerId, Customers.fullName, Orders.id AS orderId, Orders.totalCost, Menus.menuName, MenuItems.courseName, MenuItems.starterName
From Customers
INNER JOIN Orders ON Customers.id = Orders.customerId
INNER JOIN Menus ON Orders.menuId = Menus.id
INNER JOIN Menus_has_MenuItems ON Menus.id = Menus_has_MenuItems.Menus_id
Inner JOIN MenuItems ON MenuItems.id = Menus_has_MenuItems.MenuItems_id
ORDER BY Orders.totalCost ASC