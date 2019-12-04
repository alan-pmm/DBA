--WITH PROCEDURES
DECLARE u FLOAT := 1; web VARCHAR(2); estado VARCHAR(10); cler NUMBER; 
cler2 NUMBER; agente VARCHAR2(50); factur CHAR(1);
tipo VARCHAR(10); cobro CHAR(1); supplier VARCHAR(10); precio NUMBER (10,2); p NUMBER; fx NUMBER;

BEGIN
WHILE  u < 1000
LOOP
u := u + 0.4;

--------------- EQUATION AFFINE -- y = ax + p
p := 0.4;                        -- p
fx := (COS(u) * SIN(u) * 1) + p; -- ax + p
-------------------------------
  BEGIN
  --RESERVA
  estado := CASE WHEN fx < 0.2 THEN 'ABIERTA' ELSE 'CERRADA' END ;
  web := CASE WHEN fx < 0.1 THEN 'FR' 
                        WHEN fx >= 0.1 AND fx < 0.5 THEN 'DE' 
                        WHEN fx <= 0.5 AND fx > 0.8 THEN 'ES' 
                        ELSE 'RU' END ;
                        
  cler:=  B_INCREM_ALL('RESERVA');
  
  --FINANZAS
  agente:= CASE WHEN COS(u) < 0 THEN 'Melie' 
                        WHEN fx >= 0 AND fx < 0.3 THEN 'Aurelie' 
                        WHEN fx <= 0.3 AND fx > 0.8 THEN 'Merit' 
                        ELSE 'Alfretoo' END ;                     
  factur:=   CASE WHEN fx < 0 THEN 'T' 
                        WHEN fx >= 0  THEN 'F' 
                        ELSE 'T' END ;       
                        
   --PRODUCTO                     
  cler2:= B_INCREM_ALL('PRODUCTO');
  tipo:=    CASE WHEN fx < 0.3 THEN 'VUELO' 
                        WHEN fx >= 0.3  AND  fx <= 0.7 THEN 'HOTEL' 
                        ELSE 'COCHE' END ;            
  supplier:=  CASE WHEN COS(u) < 0.2 THEN 'GOOGLE' 
                        WHEN fx >= 0.2  AND  fx <= 0.666 THEN 'BING' 
                        ELSE 'YANDEX' END ;                     

  precio:= CASE WHEN fx < 0.7 THEN ABS(fx * 10)
                        WHEN fx >= 0.7  THEN ABS(fx * 10)
                        END ;      
  cobro:=   CASE WHEN fx < 0.7 THEN 'T' 
                        WHEN fx >= 0.7  THEN 'F' 
                        END ;                      
  END;

BEGIN
C_FILL_DB(  cler,web,estado,
            cler2,cler,tipo,supplier,precio,cobro,
            cler,agente,factur, 'something'
            );

c_fill_producto (cler2 +1 ,cler,tipo,supplier,precio,cobro);

COMMIT;            
END;
  
END LOOP;
END;           
