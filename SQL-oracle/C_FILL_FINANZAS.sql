create or replace PROCEDURE "C_FILL_FINANZAS" 
(
  agente_asignado FINANZAS.AGENTE_ASIGNADO%TYPE
, facturado  FINANZAS.FACTURADO%TYPE
, error FINANZAS.ERROR%TYPE
)
AS

BEGIN

INSERT INTO FINANZAS
           (RESERVA_ID
           ,AGENTE_ASIGNADO
           ,FACTURADO
           ,ERROR)
     VALUES
           (B_INCREM_R()
           ,agente_asignado
           ,facturado
           ,error);
COMMIT;
END;