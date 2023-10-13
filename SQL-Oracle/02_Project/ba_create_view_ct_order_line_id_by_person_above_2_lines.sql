
  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ALAIN".v_ba_ct_order_line_id_by_person_above_2_lines AS 
  SELECT
    person_id,
    order_id,
    COUNT(order_line_id) AS ct_oi
FROM
    a_order_history 
    GROUP BY person_id, order_id
    HAVING COUNT(order_line_id) > 2
    ORDER BY 1;

    --drop view "ALAIN"."v_ba_ct_order_line_id_by_person_above_2_lines"