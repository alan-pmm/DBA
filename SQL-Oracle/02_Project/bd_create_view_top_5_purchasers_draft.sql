CREATE OR REPLACE VIEW V_BD_list_top_5_purchasers  AS

-- SOURCE : https://www.devart.com/dbforge/oracle/studio/oracle-explain-plan.html

--EXAMPLE 01 V_BD_list_top_5_purchasers'
--EXPLAIN PLAN 
--    SET STATEMENT_ID = 'V_BD_list_top_5_purchasers_ee' 
 --STORE THE EXPLAIN PLAN INTO THE TABLE 'plan_table'    
--    INTO plan_table FOR
SELECT p.person_id,p.firstname,p.lastname,p.dateofbirth, COUNT(DISTINCT order_id) AS ct_order_id 
FROM a_order_history oh INNER JOIN a_person p ON p.person_id = oh.person_id
GROUP BY  p.person_id,p.firstname,p.lastname,p.dateofbirth
ORDER BY ct_order_id DESC
fetch  first 5 rows only;

--VIEW THE PLAN - METHOD 1 -- EXEC BY STAGE 
SELECT * FROM table(dbms_xplan.display);
SELECT * FROM table(dbms_xplan.display_cursor);

--VIEW THE PLAN - METHOD 2 -- EXEC BY STAGE 
SELECT statement_id, operation, options, object_name, optimizer,cost,cardinality,position FROM plan_table;


--CREATE INDEX IDX_ORDER_HISTORY_PERSON_ID ON A_ORDER_HISTORY (PERSON_ID);
--DROP INDEX IDX_ORDER_HISTORY_PERSON_ID;

--CREATE BITMAP INDEX idx_person_firstname_lastname ON A_PERSON (FIRSTNAME, LASTNAME);
--DROP INDEX IDX_PERSON_FIRSTNAME_LASTNAME;

CREATE INDEX idx_person_dob ON A_PERSON (DATEOFBIRTH);
DROP INDEX idx_person_dob;
