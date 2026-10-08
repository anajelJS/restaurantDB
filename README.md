# restaurantDB
This is the compulsory assignment for my DB class

Here is the SQL code for the following queries:
--------------------------------------------------------------------------------------------------------------------
• Get a list of all tables in the restaurant (overview for the front-end)
(in this one, it is relavant to know that my db holds multiple restaurants, which is why i add the restaurant ID.

SELECT *
FROM restaurantTable
WHERE restaurantID = 1
ORDER BY tableNumber;
--------------------------------------------------------------------------------------------------------------------

• Get a list of all bookings for a given customer (when they arrive at the restaurant) ordered by date

SELECT *
FROM booking
WHERE customerID = 1
ORDER BY bookingDate ASC, bookingTime ASC;

I wanted to take this a step further- so i experimented with joins to display the first and the last name of the customer as well:

SELECT
    customer.fName,
    customer.lName,
    booking.bookingID,
    booking.restaurantID,
    booking.bookingDate,
    booking.bookingTime,
    booking.numberOfGuests
FROM booking
INNER JOIN customer
    ON booking.customerID = customer.customerID
WHERE booking.customerID = 1
ORDER BY booking.bookingDate ASC, booking.bookingTime ASC;
--------------------------------------------------------------------------------------------------------------------

• Get a list of all bookings for a given tableID, including the customers for a specific
date
(then I saw this task also required actual customer info)
SELECT
    booking.bookingID,
    booking.bookingDate,
    booking.bookingTime,
    booking.numberOfGuests,
    customer.customerID,
    customer.fName,
    customer.lName,
    customer.email,
    customer.phone
FROM tableBooking
INNER JOIN booking
    ON tableBooking.bookingID = booking.bookingID
INNER JOIN customer
    ON booking.customerID = customer.customerID
WHERE tableBooking.tableID = 1
    AND booking.bookingDate = '2026-10-10'
ORDER BY booking.bookingTime ASC;
