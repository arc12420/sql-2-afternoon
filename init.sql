-----------PRACTICE JOINS----------------

-------------1
SELECT *
FROM invoice i 
JOIN invoice_line il ON il.invoice_id = i.invoice_id
Where il.unit_price > 0.99;

---------------2
SELECT i.invoice_date, c.first_name,c.last_name, i.total
from invoice i
Join customer c ON i.customer_id = c.customer_id;

---------------3
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

----------------4
SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

--------------5
SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON pt.playlist_id = p.playlist_id
WHERE p.name = 'Music';

--------------6 
SELECT t.name
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

---------------7
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

-------------------8
SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

-----------------------------------------------------------
------------PRACTICE NESTED QUERIES

-----------1
SELECT *
FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

----------------2
SELECT *
FROM playlist_track
WHERE playlist_id IN( SELECT playlist_id From playlist WHERE name = 'Music');

-----------------------3
Select name
FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

-----------------------------4
SELECT *
FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

----------------------5
Select *
From track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

--------------------------6
SELECT *
FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (SELECT artist_id FROM artist WHERE name = 'Queen'));


------------------------------------------------------------------------
----------------------------PRACTICE UPDATING ROWS

-----------1
UPDATE customer
SET fax = null
WHERE fax IS NOT null;

------------------2
UPDATE customer
SET company = 'self'
WHERE company IS null;

----------------------------3
update customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

------------------------------------4
update customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

------------------------------------------5

UPDATE track
SET composer = 'The darkness around us'
WHERE composer IS null AND genre_id IN(Select genre_id FROM genre WHERE name = 'Metal');

----------------------------------------------------------------------------

------------------GROUP BY


---------------1
SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

--------------------2
SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON (t.genre_id = g.genre_id)
WHERE g.name = 'pop' OR g.name = 'Rock'
group BY g.name;


-----------------------------3
SELECT ar.name, COUNT(*)
FROM album al
JOIN artist ar ON ar.artist_id = al.artist_id
GROUP BY ar.name;

----------------------------------------------------------------
-----------------------USE DISTINCT

----------------1
SELECT DISTINCT composer
FROM track;

----------------------------2
SELECT DISTINCT billing_postal_code
FROM invoice;

----------------------------------------3
SELECT DISTINCT company
FROM customer;

---------------------------------------------------------------------
-------------------------DELETE ROWS

--------------1

DELETE FROM practice_delete WHERE type = 'bronze';

---------------------2
DELETE FROM practice_delete WHERE type = 'silver';

---------------------------------------3
DELETE FROM practice_delete WHERE value = 150;



---------------------------------------------------------------------------
---------------------------------------eCommerce Simulation





-------------------------TABLE INFO
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    email TEXT
);


CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    price INTEGER
);


CREATE TABLE orders (
    orders_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(product_id),    
    quantity INTEGER,
    total INTEGER  
);

--------------------------------------------------------------
-----------------------------USER INFO


INSERT INTO users
(name, email)
VALUES ('James Carly', 'jimmy@CRLY.net');

INSERT INTO users
(name, email)
VALUES ('Robert Carly', 'robbie@CRLY.net');

INSERT INTO users
(name, email)
VALUES ('John Carly', 'Johnny@CRLY.net');

INSERT INTO users
(name, email)
VALUES ('Gene Carly', 'Gene@CRLY.net');

----------------------------------------------------------------------
----------------------------------PRODUCT INFO


INSERT INTO product
(name, price)
VALUES ('iphone XR', 900.00);

INSERT INTO product
(name, price)
VALUES ('iphone XS', 1200.00);

INSERT INTO product
(name, price)
VALUES ('iphone 5', 150.00);

INSERT INTO product
(name, price)
VALUES ('iphone 7', 500.00);

----------------------------------------------------------------------
------------------------------------ORDER INFO



INSERT INTO orders
(product_id, quantity, total)
VALUES (1, 100, 90000.00);

INSERT INTO orders
(product_id, quantity, total)
VALUES (2, 200, 240000.00);

INSERT INTO orders
(product_id, quantity, total)
VALUES (3, 300, 45000.00);

INSERT INTO orders
(product_id, quantity, total)
VALUES (4, 400, 200000.00);

------------------------------------------------------------------------
-----------------------------------BEGIN


Select product_id 
FROM orders 
WHERE order_id = 1;


--------------------------------------------------
Select *
FROM users;

Select *
FROM product;

Select *
FROM orders;

-------------------------------------------------------------------



ALTER TABLE orders
ADD user_id INTEGER REFERENCES users(user_id)  
;

UPDATE orders
SET user_id = 4
WHERE orders_id = 1;

SELECT *
FROM orders
WHERE user_id = 1;

SELECT COUNT (orders_id)
From orders
WHERE orders_id IS NOT null;




















