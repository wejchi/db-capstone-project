DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableId INT)
BEGIN
	DECLARE bookingValid bool;
    DECLARE newId INT;
	START transaction;
    set newId = (SELECT max(id)+1 FROM Bookings);
	INSERT INTO Bookings(id, date, tableNumber) VALUES (newId, bookingdate, tableId);
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