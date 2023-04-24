-- Create SQL queries to check available bookings based on user input: Task1

SELECT * FROM littlelemondb.bookings;


-- Create SQL queries to check available bookings based on user input: Task2

DELIMITER //  
Create PROCEDURE EE(IN BookDate DATE, ID INT)
BEGIN
	IF (select count(*) from bookings where BookingDate = BookDate and TableNumber = ID) > 0
    Then BEGIN
		SELECT CONCAT("Table ", CONVERT(TableNumber, char), " is already booked") as "Booking Status"
		From bookings
		where BookingDate = BookDate and TableNumber = ID;
		END;
    END IF;
END

call DD("2022-11-12" , 3)