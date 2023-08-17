DELIMITER //
CREATE PROCEDURE AddBooking(IN bookingId INT, IN customerid INT, IN bookingDate DATE, IN tableId INT)
BEGIN
	DECLARE bookingValid bool;
	START transaction;
	INSERT INTO Bookings(id, date, tableNumber, clientId) VALUES (bookingId, bookingdate, tableId, customerid);
    set bookingValid = (SELECT count(*)<=1 FROM Bookings WHERE date=bookingDate AND tableId=tableNumber);
    IF bookingValid THEN
		COMMIT;
        SELECT 'booking confirmed' as 'status';
	ELSE
		ROLLBACK;
        SELECT 'booking reverted' AS 'status';
	END IF;
END; //
DELIMITER ;