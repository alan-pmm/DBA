create or replace PROCEDURE "C_FILL_FINANZAS" 
(
fk_reserva_id        FINANZAS.RESERVA_ID%TYPE
,  agente_asignado   FINANZAS.AGENTE_ASIGNADO%TYPE
, facturado          FINANZAS.FACTURADO%TYPE
, error              FINANZAS.ERROR%TYPE
)
AS

BEGIN

INSERT INTO FINANZAS
           (RESERVA_ID
           ,AGENTE_ASIGNADO
           ,FACTURADO
           ,ERROR)
     VALUES
           (fk_reserva_id  
           ,agente_asignado
           ,facturado
           ,error);
COMMIT;
END;