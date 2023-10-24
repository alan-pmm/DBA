DECLARE 
i INTEGER:=0;
product_id_counted INTEGER:= 0;
person_id_counted  INTEGER:= 0;
order_line_id_counted INTEGER:=0;
order_id_counted INTEGER:=0;
sales_date DATE;

BEGIN

--CREATE UNIQUE ID FOR PERSON_ID
 SELECT COUNT( PERSON_ID) INTO person_id_counted FROM A_PERSON;
 
--CREATE UNIQUE ID FOR PRODUCT_ID
 SELECT COUNT( PRODUCT_ID) INTO product_id_counted FROM A_PRODUCT;

  --CREATE UNIQUE ID FOR ORDER_LINE_ID
  SELECT COUNT(ORDER_LINE_ID) INTO order_line_id_counted 
  FROM A_ORDER_HISTORY;
  
   --CREATE UNIQUE ID FOR ORDER_ID
  SELECT COUNT(DISTINCT ORDER_ID) 
  INTO order_id_counted 
  FROM A_ORDER_HISTORY;

  
  -- NUMBER OF ORDER_ID
FOR  o IN 1..500 LOOP  

  -- CONSTANT PARAMETER FOR LOOP 01
 --SAME PERSON ID WITHIN THE SAME ORDER_ID
  order_id_counted := order_id_counted + 1;
  sales_date:= current_date - 1000 + order_id_counted;  
  i:=0;
--LOOP 01
   LOOP
    i:=i+1;
           
    -- CONSTANT PARAMETERs FOR LOOP 
    order_line_id_counted:= order_line_id_counted + 1;

    --RUN PROC - INSERT INTO TABLE ORDER_HISTORY: 
    --sp_insert_into_order_history (order_line_id_counted, order_id_counted, sales_date, product_id_counted,person_id_counted);
    
      INSERT
       INTO A_ORDER_HISTORY
      (
      ORDER_LINE_ID,ORDER_ID,ORDER_DATE,PRODUCT_ID,PERSON_ID
      )
      VALUES
      (
        order_line_id_counted ,
        order_id_counted,
        sales_date,
        my_fx_randint(order_line_id_counted,product_id_counted),
      my_fx_randint(order_id_counted,person_id_counted) 
      ); 
    
    EXIT WHEN i > DBMS_RANDOM.VALUE(2,6);        
    END LOOP;       

END LOOP;
COMMIT;  
END; 
 