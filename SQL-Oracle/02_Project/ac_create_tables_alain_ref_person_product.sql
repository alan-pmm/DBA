--REFERENCIAL TABLES--TEMP TABLES

--TABLE PERSON
CREATE TABLE ALAIN.ref_firstname(ref_firstname VARCHAR(50));
INSERT INTO ALAIN.ref_firstname(ref_firstname) 
VALUES
('Yves'),('Rob'),('Tom'),('Ana'),('Ben'),('Tania'),('Patty'),('Ron'),('Marc');

CREATE TABLE ALAIN.ref_lastname(ref_lastname VARCHAR(50));
INSERT INTO ALAIN.ref_lastname
VALUES
('Agat'),('Dupui'),('Tomson'),('Aneth'),('Hawn'),('Bradl'),('Kamov');

--TABLE PRODUCT
CREATE TABLE ALAIN.ref_product_name(ref_product_name VARCHAR(50));
INSERT INTO ALAIN.ref_product_name
VALUES
('Trouser'),('Shirt'),('Belt'),('Coat'),('Socks'),('Jumper'),('T-Shirt'),('Short'),('Trainees');

CREATE TABLE ALAIN.ref_product_size(ref_product_size VARCHAR(50));
INSERT INTO ALAIN.ref_product_size
VALUES
('XS'),('S'),('M'),('L'),('XL'),('XXL');
