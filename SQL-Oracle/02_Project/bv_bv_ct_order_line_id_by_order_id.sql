CREATE VIEW alain.v_bv_ct_order_line_id_by_order_id AS

SELECT
    order_id, COUNT(order_line_id) AS ct_oi
FROM
    a_order_history 
    GROUP BY order_id
    ORDER BY 1
    ;
    
    --drop view "ALAIN"."v_ba_ct_order_line_id_by_person_above_2_lines"