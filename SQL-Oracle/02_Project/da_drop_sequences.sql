
BEGIN
  FOR rec IN
    (
      SELECT sequence_name FROM user_sequences WHERE sequence_name IN ('PERSON_ID_SQ','PRODUCT_ID_SQ')
    )
  LOOP
    EXECUTE immediate ' drop sequence '||rec.sequence_name || ' ';
  END LOOP;
END;
/