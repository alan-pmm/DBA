create or replace PROCEDURE "C_FILL_RESERVA" 
(
  web RESERVA.WEBSITE%TYPE
, estado RESERVA.ESTADO%TYPE
)
AS

BEGIN

INSERT INTO RESERVA
           (ID
           ,TIMESTAMP_
           ,WEBSITE
           ,ESTADO)
     VALUES
           (B_INCREM_R()
		   ,SYSDATE
           ,web
           ,estado);
COMMIT;
END;