DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookingId INT, IN bookingDate DATE)
BEGIN
	UPDATE Bookings
    SET date=bookingDate
    WHERE id=bookingId;
    SELECT * FROM Bookings WHERE id=bookingId;
END; //
DELIMITER ;