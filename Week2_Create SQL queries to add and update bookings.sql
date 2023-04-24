
/****** Create Stored Procedure AddBooking  *********/

DELIMITER //  
Create PROCEDURE AddBooking   (IN BID INT, BDATE DATE, TID INT, CID INT)
BEGIN
	INSERT INTO bookings (BooKingID, BookingDate, TableNumber, CustomerID) values (BID, BDATE, TID, CID) ;
    SELECT "New booking added" as "Confirmation";
END;
DELIMITER //

call AddBooking  ( 13,"2023-02-01", 2, 5)



/****** Create Stored Procedure UpdateBooking  *********/

DELIMITER //  
Create PROCEDURE UpdateBooking   (IN BID INT, BDATE DATE)
BEGIN
	update bookings 
    set BookingDate = BDATE
    where BookingID = BID;
    SELECT concat("Booking ", BID, " updated")  as "Confirmation";
END;
DELIMITER //

call UpdateBooking   ( 13,"2023-03-02")


/****** Create Stored Procedure CancelBooking  *********/

DELIMITER //  
Create PROCEDURE CancelBooking(IN BID INT)
BEGIN
	DELETE FROM	bookings 
    where BookingID = BID;
    SELECT concat("Booking ", BID, " cancelled")  as "Confirmation";
END;
DELIMITER //

call CancelBooking( 13)
