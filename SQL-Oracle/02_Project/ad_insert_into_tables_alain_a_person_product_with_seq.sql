
--INSERT INTO PERSON AND PRODUCT TABLES USING REF TABLES
DECLARE 

BEGIN

INSERT INTO ALAIN.A_PERSON
  (
    PERSON_ID,FIRSTNAME,LASTNAME, DATEOFBIRTH
  )
  
SELECT 
alain.person_id_sq.nextval
  --ROWNUM
, A.ref_firstname, A.ref_lastname || '-' || A.lastSecondName, current_date - DBMS_RANDOM.VALUE(15000,22000)
        FROM
        (
        SELECT 
        ref_firstname 
        ,a.ref_lastname
        ,b.ref_lastname AS lastSecondName
        FROM ALAIN.ref_firstname, ALAIN.ref_lastname a, ALAIN.ref_lastname b
        )A;
    COMMIT;

INSERT INTO ALAIN.a_product
  (
    PRODUCT_ID, PRODUCT_NAME, PRODUCT_SIZE
  )
  
SELECT 
  alain.product_id_sq.nextval
  --ROWNUM
    , B.ref_product_name
    , B.ref_product_size
        FROM
        (
        SELECT
        ref_product_name
        ,ref_product_size
        FROM ALAIN.ref_product_name, ALAIN.ref_product_size
        )B;
    COMMIT;
END;

