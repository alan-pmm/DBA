--DROP TABLESPACE IF EXISTS
BEGIN
  FOR rec IN
    (
      SELECT tablespace_name FROM SYS.DBA_DATA_FILES  WHERE tablespace_name IN ('ALAIN_SPACE')
    )
  LOOP
    EXECUTE immediate ' DROP TABLESPACE '||rec.tablespace_name || ' INCLUDING CONTENTS CASCADE CONSTRAINTS ' ;
  END LOOP;
END;
/

