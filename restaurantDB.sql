DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB;
USE restaurantDB;

CREATE TABLE restaurant (
    restaurantID INT PRIMARY KEY AUTO_INCREMENT,
    restaurantName VARCHAR(255) NOT NULL,
    restaurantAddress VARCHAR(255) NOT NULL,
    restaurantPhone VARCHAR(20) NOT NULL
);

CREATE TABLE customer (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    fName VARCHAR(255) NOT NULL,
    lName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE booking (
    bookingID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT NOT NULL,
    restaurantID INT NOT NULL,
    bookingDate DATE NOT NULL,
    bookingTime TIME NOT NULL,
    numberOfGuests INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (restaurantID) REFERENCES restaurant(restaurantID)
);

CREATE TABLE restaurantTable (
    tableID INT PRIMARY KEY AUTO_INCREMENT,
    restaurantID INT NOT NULL,
    tableNumber INT NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (restaurantID) REFERENCES restaurant(restaurantID)
);

CREATE TABLE tableBooking (
    tableBookingID INT PRIMARY KEY AUTO_INCREMENT,
    tableID INT NOT NULL,
    bookingID INT NOT NULL,
    FOREIGN KEY (tableID) REFERENCES restaurantTable(tableID),
    FOREIGN KEY (bookingID) REFERENCES booking(bookingID),
    UNIQUE (tableID, bookingID)
);

INSERT INTO restaurant (restaurantName, restaurantAddress, restaurantPhone) VALUES
('The Olive Branch', '12 Market Street', '555-0101'),
('Harbor Grill', '88 Pier Road', '555-0102'),
('Maple & Rye', '4 Oak Avenue', '555-0103'),
('Cedar Room', '210 Pine Lane', '555-0104'),
('Night Market Noodles', '55 Lantern Alley', '555-0105');

INSERT INTO customer (fName, lName, email, phone) VALUES
('Ana', 'Costa', 'ana.costa@example.com', '555-1001'),
('James', 'Okonkwo', 'james.okonkwo@example.com', '555-1002'),
('Priya', 'Shah', 'priya.shah@example.com', '555-1003'),
('Luis', 'Ortega', 'luis.ortega@example.com', '555-1004'),
('Mei', 'Chen', 'mei.chen@example.com', '555-1005'),
('Omar', 'Haddad', 'omar.haddad@example.com', '555-1006'),
('Sofia', 'Rossi', 'sofia.rossi@example.com', '555-1007'),
('Noah', 'Patel', 'noah.patel@example.com', '555-1008'),
('Elena', 'Volkova', 'elena.volkova@example.com', '555-1009'),
('Chris', 'Nguyen', 'chris.nguyen@example.com', '555-1010');

INSERT INTO restaurantTable (restaurantID, tableNumber, capacity) VALUES
(1, 1, 2),
(1, 2, 4),
(1, 3, 6),
(1, 4, 8),
(2, 1, 2),
(2, 2, 4),
(2, 3, 8),
(2, 4, 6),
(3, 1, 2),
(3, 2, 4),
(3, 3, 6),
(3, 4, 8),
(4, 1, 2),
(4, 2, 4),
(4, 3, 10),
(5, 1, 2),
(5, 2, 4),
(5, 3, 4),
(5, 4, 8);

INSERT INTO booking (customerID, restaurantID, bookingDate, bookingTime, numberOfGuests) VALUES
(1, 1, '2026-10-10', '18:30:00', 2),
(2, 1, '2026-10-10', '19:00:00', 4),
(3, 2, '2026-10-11', '20:00:00', 6),
(4, 3, '2026-10-12', '12:30:00', 2),
(1, 2, '2026-10-13', '19:30:00', 4),
(5, 1, '2026-10-14', '18:00:00', 6),
(6, 4, '2026-10-14', '19:00:00', 8),
(7, 5, '2026-10-15', '12:00:00', 2),
(8, 5, '2026-10-15', '12:30:00', 4),
(9, 3, '2026-10-16', '19:00:00', 4),
(10, 2, '2026-10-16', '18:00:00', 2),
(3, 4, '2026-10-17', '20:00:00', 4),
(6, 1, '2026-10-18', '13:00:00', 8),
(8, 3, '2026-10-18', '19:30:00', 6),
(2, 5, '2026-10-19', '18:45:00', 4),
(4, 2, '2026-10-20', '19:00:00', 6),
(9, 4, '2026-10-20', '12:00:00', 2),
(7, 1, '2026-10-21', '18:30:00', 4),
(10, 5, '2026-10-21', '19:15:00', 8),
(5, 3, '2026-10-22', '13:00:00', 2);

INSERT INTO tableBooking (tableID, bookingID) VALUES
(1, 1),
(2, 2),
(7, 3),
(9, 4),
(6, 5),
(3, 6),
(15, 7),
(16, 8),
(17, 9),
(10, 10),
(5, 11),
(14, 12),
(4, 13),
(11, 14),
(18, 15),
(8, 16),
(13, 17),
(2, 18),
(19, 19),
(12, 20);
