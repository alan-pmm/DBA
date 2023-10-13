

BEGIN
--RESET TESTED FIELDS TO NULL / EMPTY
UPDATE alain.a_person SET f_1 = '_' WHERE f_1 IS NULL;

UPDATE alain.a_person SET f_1 = 'impl3Test'  
WHERE person_id NOT IN (SELECT person_id FROM v_ba_ct_order_line_id_by_person_above_2_lines);

END;

