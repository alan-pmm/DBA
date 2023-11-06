


--TEST 01 WITH NO INDEX=======================================================================================

       
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;    


--TEST 02 --TEST QUERY WITH 2 BITMAP INDEX ON a_product (product_name) a_product(product_size) ================================
--CREATE BITMAP INDEX ON ROW HAVING LOW CARDINALITY (It MEANS FEW RECORDS DIFFERENCE)
    CREATE BITMAP INDEX idx_btm_a_product_1 ON a_product (product_name ASC) TABLESPACE ALAIN_SPACE;
    CREATE BITMAP INDEX idx_btm_a_product_2 ON a_product (product_size ASC) TABLESPACE ALAIN_SPACE;
    
--RUN QUERY
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;    


--DROP BITMAP INDEX    
DROP INDEX idx_btm_a_product_1; 
DROP INDEX idx_btm_a_product_2;
       

--TEST 03 --TEST QUERY WITH A BITMAP INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE BITMAP INDEX idx_btm_a_product_3 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;

--RUN QUERY
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF; 

--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_3; 
  
    
--TEST 04 --TEST QUERY WITH A NONUNIQUE INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE INDEX idx_btm_a_product_4 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;

--RUN QUERY
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF; 
    

--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_4;    
    


--SELECT * FROM table(dbms_xplan.display);
--SELECT * FROM table(dbms_xplan.display_cursor);
--SELECT * V$SQL_PLAN






