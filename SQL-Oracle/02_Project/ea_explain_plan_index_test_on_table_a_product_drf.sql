Select * from table(dbms_xplan.display_cursor(null,null,'basic'));


select
-- sqp.id,
-- sqp.parent_id,
   lpad('| ', (sqp.depth-1) * 2, '| ') || sqp.operation || case when sqp.options is not null then ' (' || sqp.options || ')' end op,
-- sqp.options,
   sqp.object_owner,
   sqp.object_name,
   sqp.access_predicates,
   sqp.filter_predicates,
   sqp.object_alias,
   sqp.qblock_name,
   sqp.projection,
   sqp.time,
   sqp.object_type,
   sqp.position,
   sqp.plan_hash_value
--   sqp.*
from
   v$sql_plan sqp


SELECT sqp.* FROM 
   v$sql_plan sqp WHERE SQL_ID = 'dnh1q0up767xv'

TRUNCATE TABLE    v$sql_plan sqp;

--TEST 01 =======================================================================================
EXPLAIN PLAN SET STATEMENT_ID = 'ckid01'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  product_name, product_size, COUNT(oh.order_line_id)  FROM a_product pd INNER JOIN a_order_history oh ON pd.product_id = oh.product_id
    WHERE product_name = 'Socks' AND product_size LIKE '%S%'
    GROUP BY product_name, product_size
    ORDER BY 1 DESC;
       
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Socks' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;    


--TEST 02 --TEST QUERY WITH 2 BITMAP INDEX ON a_product (product_name) a_product(product_size) ================================
--CREATE BITMAP INDEX ON ROW HAVING LOW CARDINALITY (It MEANS FEW RECORDS DIFFERENCE)
    CREATE BITMAP INDEX idx_btm_a_product_1 ON a_product (product_name ASC) TABLESPACE ALAIN_SPACE;
    CREATE BITMAP INDEX idx_btm_a_product_2 ON a_product (product_size ASC) TABLESPACE ALAIN_SPACE;
    CREATE BITMAP INDEX idx_btm_a_order_hist_2 ON a_order_history (product_id ASC) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid02'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  product_name, product_size, COUNT(oh.order_line_id)  FROM a_product pd INNER JOIN a_order_history oh ON pd.product_id = oh.product_id
    WHERE product_name = 'Socks' AND product_size LIKE '%S%'
    GROUP BY product_name, product_size
    ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_1; 
    DROP INDEX idx_btm_a_product_2;
      DROP INDEX idx_btm_a_order_hist_2

SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Socks' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;    


    
--TEST 03 --TEST QUERY WITH A BITMAP INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE BITMAP INDEX idx_btm_a_product_3 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid03'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  product_name, product_size, COUNT(oh.order_line_id)  FROM a_product pd INNER JOIN a_order_history oh ON pd.product_id = oh.product_id
    WHERE product_name = 'Socks' AND product_size LIKE '%S%'
    GROUP BY product_name, product_size
    ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_3; 

SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Socks' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;        
    
 --TEST 04 --TEST QUERY WITH A NONUNIQUE INDEX ON a_product (product_name ASC, product_size) ================================
    CREATE INDEX idx_btm_a_product_4 ON a_product (product_name ASC, product_size) TABLESPACE ALAIN_SPACE;
--RUN EXPLAIN PLAN
EXPLAIN PLAN SET STATEMENT_ID = 'ckid04'
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
    INTO plan_table FOR
    SELECT  product_name, product_size, COUNT(oh.order_line_id)  FROM a_product pd INNER JOIN a_order_history oh ON pd.product_id = oh.product_id
    WHERE product_name = 'Socks' AND product_size LIKE '%S%'
    GROUP BY product_name, product_size
    ORDER BY 1 DESC;
--DROP BITMAP INDEX    
    DROP INDEX idx_btm_a_product_4;    
    
SET AUTOTRACE ON;
   SELECT  *  FROM a_product WHERE product_name = 'Socks' AND product_size LIKE '%S%' ORDER BY 1 DESC;
SET AUTOTRACE OFF;    


CREATE OR REPLACE VIEW v_ea_explain_plan_with_bitmap_index_table_a_product AS
SELECT statement_id, operation, options, object_name, optimizer,cost,cardinality,position,io_cost AS disq_read_io ,cpu_cost,time FROM plan_table
WHERE statement_id LIKE 'ckid%';

CREATE OR REPLACE VIEW v_eb_explain_plan_with_bitmap_index_table_a_product_aggr AS
SELECT statement_id AS st_id, SUM(cost) AS sum_cost
, SUM(cardinality) AS sum_cardinality
,SUM(position) AS sum_position,
SUM(io_cost) AS sum_disq_read_io ,
SUM(cpu_cost) AS sum_cpu_cost
FROM plan_table
WHERE statement_id LIKE 'ckid%'
GROUP BY st_id;

--SELECT * FROM table(dbms_xplan.display);
--SELECT * FROM table(dbms_xplan.display_cursor);
--SELECT * V$SQL_PLAN






