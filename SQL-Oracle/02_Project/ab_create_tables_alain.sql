CREATE TABLE ALAIN.a_person
(
person_id NUMBER(*,0) NOT NULL,
firstname VARCHAR(50),
lastname VARCHAR(50),
dateofbirth DATE,
CONSTRAINT pk_person_id PRIMARY KEY (person_id)
)TABLESPACE ALAIN_SPACE 
;

CREATE TABLE ALAIN.a_product
(
product_id NUMBER(*,0) NOT NULL,
product_name VARCHAR(50),
CONSTRAINT pk_product_id PRIMARY KEY (product_id)
)TABLESPACE ALAIN_SPACE 
;

CREATE TABLE ALAIN.a_order_history
   (	order_id NUMBER(*,0), 
    order_date TIMESTAMP (6), 
    product_id NUMBER(*,0), 
    person_id NUMBER(*,0),
CONSTRAINT pk_order_id PRIMARY KEY (order_id)
) TABLESPACE ALAIN_SPACE
;

ALTER  TABLE ALAIN.a_order_history
ADD CONSTRAINT fk_product_id foreign key("PRODUCT_ID") references "A_PRODUCT"("PRODUCT_ID")
;
ALTER  TABLE ALAIN.a_order_history
ADD CONSTRAINT fk_person_id foreign key("PERSON_ID") references "A_PERSON"("PERSON_ID")
;

