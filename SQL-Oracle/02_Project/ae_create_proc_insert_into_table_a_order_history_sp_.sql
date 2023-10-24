CREATE OR REPLACE PROCEDURE sp_insert_into_order_history 
(
  oli NUMBER
, oi   NUMBER 
, od TIMESTAMP 
, pti NUMBER
, prsi  NUMBER
) AS
BEGIN

INSERT INTO a_order_history 
(
    order_line_id,
    order_id,
    order_date,
    product_id,
    person_id
    )
VALUES 
(
    oli,
    oi,
    od,
    pti,
    prsi
);

END sp_insert_into_order_history;

--SELECT * FROM user_procedures;


