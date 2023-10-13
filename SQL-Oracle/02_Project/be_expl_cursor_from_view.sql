DECLARE
----RECORDS FROM CURSOR (WE use CURSOR RECORDS AS A TEMPORARY TABLE)
pid  v_ba_ct_order_line_id_by_person_above_2_lines.person_id%type;
orid  v_ba_ct_order_line_id_by_person_above_2_lines.order_id%type;
ct_olid v_ba_ct_order_line_id_by_person_above_2_lines.ct_oi%type;

--EXPLICIT CURSOR
CURSOR c1 IS
SELECT person_id,order_id, ct_oi FROM v_ba_ct_order_line_id_by_person_above_2_lines;

BEGIN
--RESET TESTED FIELDS TO NULL / EMPTY
UPDATE alain.a_person SET f_1 = '';

OPEN c1;
    LOOP
    FETCH c1 INTO pid, orid, ct_olid;
    EXIT WHEN c1%notfound;
    UPDATE alain.a_person SET f_1 = 'cursor1Test' WHERE alain.a_person.person_id = pid;
    END LOOP;
    CLOSE c1;
END;