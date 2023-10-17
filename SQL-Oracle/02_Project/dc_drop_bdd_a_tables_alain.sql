
BEGIN
  FOR rec IN
    (
      SELECT
        table_name
      FROM
        all_tables
      WHERE owner = 'ALAIN'
        AND table_name IN ('A_PRODUCT','A_PERSON','A_ORDER_HISTORY')
    )
  LOOP
    EXECUTE immediate 'DROP TABLE  '||rec.table_name || ' CASCADE CONSTRAINTS';
  END LOOP;
END;
/