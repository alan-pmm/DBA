CREATE OR REPLACE FUNCTION my_fx_randint (param1 NUMBER, param2 NUMBER) 
RETURN NUMBER 
AS 
randout NUMBER;
my_sec NUMBER;

BEGIN
SELECT EXTRACT(SECOND FROM current_timestamp) INTO my_sec from dual;
randout:= ROUND(
                            (ABS(
                                    COS(param1)*SIN(param1)*SIN(my_sec)
                                    )*param2+1));

RETURN randout;
END my_fx_randint;