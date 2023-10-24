CREATE SCHEMA AUTHORIZATION ALAIN
CREATE TABLE ALAIN.a_person
(
person_id NUMBER(*,0) NOT NULL,
firstname VARCHAR(50),
lastname VARCHAR(50),
dateofbirth DATE,
f_1 VARCHAR(50),
f_2 VARCHAR(50),
CONSTRAINT pk_person_id PRIMARY KEY (person_id)
)TABLESPACE ALAIN_SPACE 


CREATE TABLE ALAIN.a_product
(
product_id NUMBER(*,0) NOT NULL,
product_name VARCHAR(50),
product_size VARCHAR(50),
f_1 VARCHAR(50),
f_2 VARCHAR(50),
CONSTRAINT pk_product_id PRIMARY KEY (product_id)
)TABLESPACE ALAIN_SPACE 

CREATE TABLE ALAIN.a_order_history
   (order_line_id NUMBER(*,0),
    order_id NUMBER(*,0), 
    order_date TIMESTAMP (6), 
    product_id NUMBER(*,0), 
    person_id NUMBER(*,0),
    f_1 VARCHAR(50),
    f_2 VARCHAR(50),
CONSTRAINT pk_order_line_id PRIMARY KEY(order_line_id)
) TABLESPACE ALAIN_SPACE

;
