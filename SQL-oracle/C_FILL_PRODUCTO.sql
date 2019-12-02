create or replace PROCEDURE "C_FILL_PRODUCTO" 
(
  tipo PRODUCTO.TIPO%TYPE
, proveedor PRODUCTO.PROVEEDOR%TYPE
, precio_en_eur PRODUCTO.PRECIO_EN_EUR%TYPE
, cobrado PRODUCTO.COBRADO%TYPE
)
AS

BEGIN

INSERT INTO PRODUCTO
           (ID
           ,RESERVA_ID
           ,PROVEEDOR
           ,PRECIO_EN_EUR
           , COBRADO)
     VALUES
           (B_INCREM_P()
           ,B_INCREM_R()
           ,proveedor
           ,precio_en_eur
           , cobrado);
COMMIT;
END;