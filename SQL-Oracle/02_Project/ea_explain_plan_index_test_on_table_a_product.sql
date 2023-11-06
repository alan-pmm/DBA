
--=======================================================================================
-- RUN SEVERAL EXPLAIN SCENARIOS FROM SAME QUERY AND CREATE A VIEW USING THE TABLE 'plan_table'
--
--=======================================================================================
--FLUSH plan_table
DELETE FROM plan_table;


--TEST 01 =======================================================================================
EXPLAIN PLAN SET STATEMENT_ID = 'ckid01'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
       SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
       

--TEST 02 --TEST QUERY WITH 2 BITMAP INDEX ON a_product (product_name) a_product(product_size) ================================
--CREATE BITMAP INDEX ON ROW HAVING LOW CARDINALITY (It MEANS FEW RECORDS DIFFERENCE)
    CREATE BITMAP INDEX idx_btm_a_product_1 ON a_product (product_name ASC) TABLESPACE ALAIN_SPACE;
    CREATE BITMAP INDEX idx_btm_a_product_2 ON a_product (product_size ASC) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid02'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_1; 
    DROP INDEX idx_btm_a_product_2;
 


--TEST 03 --TEST QUERY WITH A BITMAP INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE BITMAP INDEX idx_btm_a_product_3 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid03'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_3; 

 --TEST 04 --TEST QUERY WITH A NONUNIQUE INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE INDEX idx_btm_a_product_4 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid04'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
     SELECT  *  FROM a_product WHERE product_name = 'Trouser' AND product_size LIKE '%S%' ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_4;    
    

--CREATE OR REPLACE THE VIEW v_ea_explain_plan_with_bitmap_index_table_a_product
CREATE OR REPLACE VIEW v_ea_explain_plan_with_bitmap_index_table_a_product AS
SELECT statement_id, operation, options, object_name, optimizer,cost,cardinality,position,io_cost AS disq_read_io ,cpu_cost,time FROM plan_table
WHERE statement_id LIKE 'ckid%'ORDER BY statement_id DESC;

CREATE OR REPLACE VIEW v_eb_explain_plan_with_bitmap_index_table_a_product_aggr AS
SELECT statement_id AS st_id, SUM(cost) AS sum_cost
,SUM(cardinality) AS sum_cardinality
,SUM(position) AS sum_position,
SUM(io_cost) AS sum_disq_read_io ,
SUM(cpu_cost) AS sum_cpu_cost
FROM plan_table
WHERE statement_id LIKE 'ckid%'
GROUP BY st_id;







