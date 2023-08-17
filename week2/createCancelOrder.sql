CREATE procedure CancelOrder(IN canceledId INT)
DELETE FROM Orders WHERE id = canceledId;