DECLARE 
increm INTEGER := 0;
increm_product INTEGER := 0;
counter  INTEGER :=0;
counter_order INTEGER :=0;
order_line_id INTEGER:=0;
order_id_counted INTEGER:=0;

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
  (PRODUCT_ID, PRODUCT_NAME, PRODUCT_SIZE, product_codification
  ) VALUES
  (increm_product,  
  CASE ROUND(DBMS_RANDOM.VALUE(1,6))
    WHEN 1 THEN 'Trouser'
    WHEN 2 THEN 'Tie'
    WHEN 3 THEN 'Shirt'
    WHEN 4 THEN 'Socks'
    WHEN 5 THEN 'Underwear'
    WHEN 6 THEN 'Jumper'
    END,
    CASE ROUND(DBMS_RANDOM.VALUE(1,6))
    WHEN 1 THEN 'M'
    WHEN 2 THEN 'XL'
    WHEN 3 THEN 'S'
    WHEN 4 THEN 'L'
    WHEN 5 THEN 'XS'
    WHEN 6 THEN 'XXL'
    END,
    to_char(increm_product)  
    )
  ;
    
  COMMIT;    
  
  
   BEGIN
              
              --CREATE UNIQUE ID FOR ORDER_LINE_ID
              SELECT COUNT( ORDER_LINE_ID)
              INTO order_line_id 
              FROM A_ORDER_HISTORY;
              
               --CREATE UNIQUE ID FOR ORDER_ID
              SELECT COUNT( ORDER_ID)
              INTO order_id_counted 
              FROM A_ORDER_HISTORY;
              
              
              WHILE counter_order < DBMS_RANDOM.VALUE(1,10)
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
                order_id_counted,
                 current_date,
                DBMS_RANDOM.VALUE(1,increm_product),
                DBMS_RANDOM.VALUE(1,increm)
              ); 
              
              COMMIT;  
              
            END LOOP;
             END; 

    
  END LOOP;
  
  END;
