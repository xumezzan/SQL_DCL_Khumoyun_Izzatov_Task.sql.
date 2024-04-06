CREATE USER 'rentaluser'@'localhost' IDENTIFIED BY 'rentalpassword';

GRANT CONNECT ON *.* TO 'rentaluser'@'localhost';

GRANT SELECT ON dvd_rental.customer TO 'rentaluser'@'localhost';

SELECT * FROM dvd_rental.customer;

SELECT * FROM dvd_rental.customer;

CREATE ROLE rental;

GRANT rental TO 'rentaluser'@'localhost';

GRANT INSERT, UPDATE ON dvd_rental.rental TO rental;

-- Insert a new row
INSERT INTO dvd_rental.rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES ('2024-04-10', 1, 1, '2024-04-12', 1);

-- Update an existing row
UPDATE dvd_rental.rental
SET return_date = '2024-04-11'
WHERE rental_id = 1;

REVOKE INSERT ON dvd_rental.rental FROM rental;

-- This should result in an error
INSERT INTO dvd_rental.rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES ('2024-04-10', 1, 1, '2024-04-12', 1);

CREATE ROLE client_John_Smith;

GRANT SELECT ON dvd_rental.rental TO client_John_Smith;
GRANT SELECT ON dvd_rental.payment TO client_John_Smith;


SET ROLE 'client_John_Smith';

SELECT * FROM dvd_rental.rental WHERE customer_id = 1;
SELECT * FROM dvd_rental.payment WHERE customer_id = 1;
