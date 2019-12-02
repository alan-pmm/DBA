--WITHOUT PROC

DECLARE u FLOAT := 1; web VARCHAR(2); estado VARCHAR(10); cler NUMBER; cler2 NUMBER; agente VARCHAR2(50); factur CHAR(1);
tipo VARCHAR(10); cobro CHAR(1); precio NUMBER (10,2);

BEGIN
WHILE  u < 1500
LOOP
u := u + 1;
  BEGIN
  --RESERVA
  estado := CASE WHEN COS(u) < 0.2 THEN 'ABIERTA' ELSE 'CERRADA' END ;
  web := CASE WHEN COS(u) < 0.1 THEN 'FR' 
                        WHEN COS(u) >= 0.1 AND COS(u) < 0.5 THEN 'DE' 
                        WHEN COS(u) <= 0.5 AND COS(u) > 0.8 THEN 'ES' 
                        ELSE 'RU' END ;
  cler:=  B_INCREM_R();
  
  --FINANZAS
  agente:= CASE WHEN COS(u) < 0 THEN 'Melie' 
                        WHEN COS(u) >= 0 AND COS(u) < 0.3 THEN 'Aurelie' 
                        WHEN COS(u) <= 0.3 AND COS(u) > 0.8 THEN 'Merit' 
                        ELSE 'Alfretoo' END ;                     
  factur:=   CASE WHEN COS(u) < 0 THEN 'T' 
                        WHEN COS(u) >= 0  THEN 'F' 
                        ELSE 'T' END ;       
                        
   --PRODUCTO                     
   cler2:= B_INCREM_P();
   tipo:=    CASE WHEN COS(u) < 0.3 THEN 'VUELO' 
                        WHEN COS(u) >= 0.3  AND  COS(u) <= 0.8 THEN 'HOTEL' 
                        ELSE 'COCHE' END ;            
  cobro:=   CASE WHEN COS(u) < 0.7 THEN 'T' 
                        WHEN COS(u) >= 0.7  THEN 'F' 
                        END ;
  precio:= CASE WHEN COS(u) < 0.7 THEN ABS(cos(u) * 10)
                        WHEN COS(u) >= 0.7  THEN ABS(sin(u) * 10)
                        END ;                       
  END;

INSERT INTO RESERVA
           (ID,TIMESTAMP_,WEBSITE,ESTADO)
     VALUES
           (cler ,SYSDATE,web ,estado);
COMMIT;

INSERT INTO FINANZAS (RESERVA_ID,AGENTE_ASIGNADO ,FACTURADO ,ERROR)
     VALUES
           (cler,agente,factur,'null');
COMMIT;

INSERT INTO PRODUCTO
           (ID ,RESERVA_ID,TIPO,PROVEEDOR,PRECIO_EN_EUR,COBRADO)
     VALUES
           (cler2 ,cler,tipo ,'IBIS' ,precio,cobro);
COMMIT;

END LOOP;
END;           
