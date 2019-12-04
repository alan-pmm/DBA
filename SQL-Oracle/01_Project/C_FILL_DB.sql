create or replace PROCEDURE "C_FILL_DB" 
(
  reserva_id    RESERVA.ID%TYPE
, web           RESERVA.WEBSITE%TYPE
, estado        RESERVA.ESTADO%TYPE
, producto_id   PRODUCTO.ID%TYPE
, fk_p_reserva_id PRODUCTO.RESERVA_ID%TYPE
, tipo           PRODUCTO.TIPO%TYPE
, proveedor      PRODUCTO.PROVEEDOR%TYPE
, precio_en_eur  PRODUCTO.PRECIO_EN_EUR%TYPE
, cobrado        PRODUCTO.COBRADO%TYPE
, fk_f_reserva_id         FINANZAS.RESERVA_ID%TYPE
, agente_asignado        FINANZAS.AGENTE_ASIGNADO%TYPE
, facturado              FINANZAS.FACTURADO%TYPE
, erreur                 FINANZAS.ERROR%TYPE
)
AS

BEGIN

INSERT INTO RESERVA
           (ID,TIMESTAMP_,WEBSITE,ESTADO)
     VALUES
           (reserva_id,SYSDATE,web,estado);
           
INSERT INTO PRODUCTO
           (ID,RESERVA_ID,TIPO,PROVEEDOR,PRECIO_EN_EUR, COBRADO)
     VALUES
           (producto_id,fk_p_reserva_id,tipo,proveedor,precio_en_eur, cobrado);       

INSERT INTO FINANZAS
           (RESERVA_ID,AGENTE_ASIGNADO,FACTURADO,ERROR)
     VALUES
           (fk_f_reserva_id,agente_asignado,facturado,erreur);
           
COMMIT;
END;