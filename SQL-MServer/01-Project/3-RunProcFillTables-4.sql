USE [SQLSERVERDB]
GO

--START LOOP
DECLARE @i TINYINT = 0, @f TINYINT -- < HOW MANY RECORDS WE WANT TO INSERT

WHILE @i  < 1000

BEGIN
SET @f = 0.4 + (COS(@i * SIN(@i))) -- I HAVE USED A COS OPERATOR FOR RANDOMIZATION
--SET @z = 0 * @i + 1 + (COS(@i * SIN(@i)) * 1)
					
DECLARE @web VARCHAR(10) =	(SELECT CASE WHEN @f < 0.1 THEN 'FR' 
								WHEN @f >= 0.1 AND @f < 0.5 THEN 'DE' 
								WHEN @f <= 0.5 AND @f > 0.8 THEN 'ES' 
								ELSE 'RU' END)

DECLARE @agent VARCHAR(10) = (SELECT CASE WHEN @f < 0 THEN 'Melie' 
								WHEN @f >= 0 AND @f < 0.3 THEN 'Aurelie' 
								WHEN @f <= 0.3 AND @f > 0.8 THEN 'Merit' 
								ELSE 'Alfretoo' END)                  
DECLARE @estado VARCHAR(10) = (SELECT CASE 
									 WHEN @f <= 0.3 THEN 'CERRADA'
								   	 WHEN @f > 0.3 AND @f < 0.7 THEN 'ABIERTA'
							   ELSE 'CERRADA' END)
DECLARE @cobrado CHAR(1) = (SELECT CASE 
							   WHEN @f <= 0.3 THEN 'F'
							   WHEN @f > 0.3 AND @f < 0.7 THEN 'T'
							   ELSE 'T' END)
DECLARE @facturado VARCHAR(10) = (SELECT CASE 
									WHEN @f < 0.8 THEN 'T'
									ELSE 'F'
									END)
DECLARE @tipo VARCHAR (10) = (SELECT CASE 
							   WHEN @f <= 0.3 THEN 'VUELO'
							   WHEN @f > 0.3 AND @f < 0.7 THEN 'HOTEL'
							   ELSE 'COCHE'
							   END)
DECLARE @supplier VARCHAR (10) = (SELECT CASE 
							   WHEN @f <= 0.3 THEN 'GOOGLE'
							   WHEN @f > 0.3 AND @f < 0.7 THEN 'YANDEX'
							   ELSE 'BING'
							   END)

DECLARE @pbook NUMERIC (10,2) = (SELECT ABS(CHECKSUM(NewId())) % 100 + @i)

SET @i = @i + 1
EXEC dbo.FILL_RAND_TABLES @web,@estado,@agent, @facturado,'Null',@tipo,@supplier,@pbook,@cobrado
END



