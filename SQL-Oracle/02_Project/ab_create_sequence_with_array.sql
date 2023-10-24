
--SELECT  sequence_name FROM dba_sequences WHERE SEQUENCE_NAME  IN ('PERSON_ID_SQ' ,'PRODUCT_ID_SQ')
DECLARE 
TYPE array_chr_sq IS VARRAY(3) OF VARCHAR(20);
ARRAY array_chr_sq:=array_chr_sq('person_id_sq' ,'product_id_sq');

BEGIN
FOR rec IN 1..ARRAY.COUNT
LOOP
EXECUTE immediate 'CREATE SEQUENCE ' || ARRAY(rec) || ' INCREMENT BY 1 START WITH 1';
END LOOP;
COMMIT;
END;