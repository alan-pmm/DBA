
BEGIN
  FOR rec IN
    (
      SELECT table_name FROM all_tables WHERE owner = 'ALAIN' AND table_name IN ('A_PRODUCT','A_PERSON','A_ORDER_HISTORY') ORDER BY table_name
    )
  LOOP
    EXECUTE immediate 'TRUNCATE  TABLE '||rec.table_name ||' DROP STORAGE';
  END LOOP;
END;
/

