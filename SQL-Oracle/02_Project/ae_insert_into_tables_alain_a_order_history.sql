DECLARE 
i INTEGER:=0;
product_id_counted INTEGER:= 0;
person_id_counted  INTEGER:= 0;
counter_order INTEGER:=0;
order_line_id_counted INTEGER:=0;
order_id_counted INTEGER:=0;
sales_date DATE;

BEGIN
WHILE i < 50

LOOP
i := i + 1;
--CREATE UNIQUE ID FOR PERSON_ID
 SELECT COUNT( PERSON_ID)
 INTO person_id_counted 
 FROM A_PERSON;
 
--CREATE UNIQUE ID FOR PRODUCT_ID
 SELECT COUNT( PRODUCT_ID)
 INTO product_id_counted 
 FROM A_PRODUCT;

  --CREATE UNIQUE ID FOR ORDER_LINE_ID
  SELECT COUNT( ORDER_LINE_ID)
  INTO order_line_id_counted 
  FROM A_ORDER_HISTORY;
  
   --CREATE UNIQUE ID FOR ORDER_ID
  SELECT COUNT(DISTINCT ORDER_ID)
  INTO order_id_counted 
  FROM A_ORDER_HISTORY;
  
  --SAME PERSON ID WITHIN THE SAME ORDER_ID
  person_id_counted:= DBMS_RANDOM.VALUE(1,person_id_counted) ; 
  sales_date:= current_date - 1000 * ROUND(abs(COS(order_id_counted)));
  
      WHILE counter_order < ROUND(DBMS_RANDOM.VALUE(2,30))
      LOOP
      order_line_id_counted :=order_line_id_counted  + 1;
      counter_order:= counter_order + 1; -- LOOP FOR SOME FOREIGN REGISTRY
      
       INSERT
       INTO A_ORDER_HISTORY
      (ORDER_LINE_ID,ORDER_ID,ORDER_DATE,PRODUCT_ID,PERSON_ID
      )
      VALUES
      (
        order_line_id_counted ,
        order_id_counted + 1,
        sales_date,
        DBMS_RANDOM.VALUE(1,product_id_counted),
    person_id_counted
      ); 

    END LOOP;
    
 END LOOP;       
 
COMMIT;  
 END; 
 
 
