DECLARE
--EXPLICIT CURSOR
CURSOR c2 IS
SELECT  *  FROM v_ba_ct_order_line_id_by_person_above_2_lines;
--RECORDS FROM CURSOR
c2_row c2%ROWTYPE;

BEGIN
--RESET TESTED FIELDS TO NULL / EMPTY
UPDATE alain.a_person SET f_2 = '';

OPEN c2;
    LOOP
    FETCH c2 INTO c2_row;
    EXIT WHEN c2%notfound;
    UPDATE alain.a_person SET f_2 = 'cusor2Test' WHERE alain.a_person.person_id = c2_row.person_id;
    END LOOP;
CLOSE c2;
END;