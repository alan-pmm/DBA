create or replace PROCEDURE "C_FILL_RESERVA" 
(
  reserva_id   RESERVA.ID%TYPE
, web          RESERVA.WEBSITE%TYPE
, estado       RESERVA.ESTADO%TYPE
)
AS

BEGIN

INSERT INTO RESERVA
           (ID
           ,TIMESTAMP_
           ,WEBSITE
           ,ESTADO)
     VALUES
           (reserva_id
		   ,SYSDATE
           ,web
           ,estado);
COMMIT;
END;