--REFERENCIAL TABLES

--TEMP TABLES

--TABLE PERSON
CREATE TABLE ALAIN.firstname(firstname VARCHAR(50));
INSERT INTO ALAIN.firstname(firstname) 
VALUES
('Yves'),('Rob'),('Tom'),('Ana'),('Ben'),('Tania'),('Patty'),('Ron');

CREATE TABLE ALAIN.lastname(lastname VARCHAR(50));
INSERT INTO ALAIN.lastname
VALUES
('Agat'),('Dupui'),('Tomson'),('Aneth'),('Hawn'),('Bradl'),('Kamov');

--TABLE PRODUCT
CREATE TABLE ALAIN.product_name(product_name VARCHAR(50));
INSERT INTO ALAIN.product_name
VALUES
('Trouser'),('Shirt'),('Belt'),('Coat'),('Socks'),('Jumper'),('T-Shirt'),('Short'),('Trainees');

CREATE TABLE ALAIN.product_size(product_size VARCHAR(50));
INSERT INTO ALAIN.product_size
VALUES
('XS'),('S'),('M'),('L'),('XL'),('XXL');

