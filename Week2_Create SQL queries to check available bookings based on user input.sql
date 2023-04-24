-- Create SQL queries to check available bookings based on user input: Task1

SELECT * FROM littlelemondb.bookings;


-- Create SQL queries to check available bookings based on user input: Task2

DELIMITER //  
Create PROCEDURE CheckBooking (IN BookDate DATE, ID INT)
BEGIN
	IF (select count(*) from bookings where BookingDate = BookDate and TableNumber = ID) > 0
    Then BEGIN
		SELECT CONCAT("Table ", CONVERT(TableNumber, char), " is already booked") as "Booking Status"
		From bookings
		where BookingDate = BookDate and TableNumber = ID;
		END;
    END IF;
END

call CheckBooking("2022-11-12" , 3)



-- Create SQL queries to check available bookings based on user input: Task3

DELIMITER //  
Create PROCEDURE AddValidBooking (IN BookDate DATE, ID INT)
BEGIN 
    START TRANSACTION;
		
		INSERT INTO bookings (BookingDate, TableNumber) VALUES (BookDate, ID);
	       
        IF (select count(*) from bookings where BookingDate = BookDate and TableNumber = ID) > 1
			THEN BEGIN 
				ROLLBACK;
                SELECT CONCAT("Table ", CONVERT(TableNumber, char), " is already booked - booking cancelled" ) as "Booking Status"
				From bookings where BookingDate = BookDate and TableNumber = ID;    
			END;             
		END IF;
END			

        
call AddValidBooking("2022-12-18", 6)
