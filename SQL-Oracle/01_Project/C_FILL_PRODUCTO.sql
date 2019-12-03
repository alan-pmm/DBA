create or replace PROCEDURE "C_FILL_PRODUCTO" 
(
  producto_id PRODUCTO.ID%TYPE
,  fk_reserva_id PRODUCTO.RESERVA_ID%TYPE
,  tipo PRODUCTO.TIPO%TYPE
, proveedor PRODUCTO.PROVEEDOR%TYPE
, precio_en_eur PRODUCTO.PRECIO_EN_EUR%TYPE
, cobrado PRODUCTO.COBRADO%TYPE
)
AS

BEGIN

INSERT INTO PRODUCTO
           (ID
           ,RESERVA_ID
           ,TIPO
           ,PROVEEDOR
           ,PRECIO_EN_EUR
           , COBRADO)
     VALUES
           (producto_id
           ,fk_reserva_id
           ,tipo
           ,proveedor
           ,precio_en_eur
           , cobrado);
COMMIT;
END;