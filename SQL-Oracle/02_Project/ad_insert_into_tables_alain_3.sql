DECLARE 
increm INTEGER := 0;
increm_product INTEGER := 0;
counter  INTEGER :=0;
counter_order INTEGER :=0;
order_line_id INTEGER:=0;

BEGIN
--CREATE UNIQUE ID FOR PERSON_ID
SELECT COUNT( PERSON_ID)
INTO increm 
FROM A_PERSON;
--CREATE UNIQUE ID FOR PRODUCT_ID
SELECT COUNT( PRODUCT_ID)
INTO increm_product 
FROM A_PRODUCT;


WHILE counter < 10
LOOP
counter := counter + 1;
increm := increm + 1;
increm_product:= increm_product +1;
  
INSERT INTO A_PERSON
  (
    PERSON_ID,FIRSTNAME,LASTNAME, DATEOFBIRTH
  )
  VALUES
  (
    increm,
     CHR(TRUNC(SYS.DBMS_RANDOM.VALUE(65,67))),
      CHR(TRUNC(SYS.DBMS_RANDOM.VALUE(45,67))),
    current_date
  );
    COMMIT;
    
  INSERT INTO A_PRODUCT
  (PRODUCT_ID, PRODUCT_NAME
  ) VALUES
  (increm_product,  CHR(TRUNC(SYS.DBMS_RANDOM.VALUE(15,87))))
  ;
    
  COMMIT;    
  
  
   BEGIN
              
              --CREATE UNIQUE ID FOR ORDER_LINE_ID
              SELECT COUNT( ORDER_LINE_ID)
              INTO order_line_id 
              FROM A_ORDER_HISTORY;
              
              WHILE counter_order < 30
              LOOP
              counter_order:=counter_order + 1;
              order_line_id := order_line_id  + 1;
              
               INSERT
               INTO A_ORDER_HISTORY
              (ORDER_LINE_ID,ORDER_ID,ORDER_DATE,PRODUCT_ID,PERSON_ID
              )
              VALUES
              (
                order_line_id ,
                DBMS_RANDOM.VALUE(15,87),
                 current_date,
                DBMS_RANDOM.VALUE(1,increm_product),
                DBMS_RANDOM.VALUE(1,increm)
              ); 
              
              COMMIT;  
              
            END LOOP;
             END; 

    
  END LOOP;
  
  END;
