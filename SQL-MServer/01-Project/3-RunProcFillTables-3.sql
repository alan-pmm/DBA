USE [SQLSERVERDB]
GO


CREATE TABLE #A (ID TINYINT, name VARCHAR(10));
INSERT INTO #A VALUES (0,'Ben'),(1,'Tod'),(2,'Sonia')
,(3,'Alain'),(4,'Katia'),(5,'Pat'),(6,'Igor'),(7,'Natashkin');
CREATE CLUSTERED INDEX A ON #A(ID);

CREATE TABLE #B (ID TINYINT, name VARCHAR(10));
INSERT INTO #B VALUES (0,'CERRADA'),(1,'ABIERTA'),(2,'CERRADA');
CREATE CLUSTERED INDEX B ON #B(ID);

CREATE TABLE #C (ID TINYINT, name VARCHAR(10));
INSERT INTO #C VALUES (0,'T'),(1,'F'),(2,'T');
CREATE CLUSTERED INDEX C ON #C(ID);

--START LOOP
DECLARE @i TINYINT = 0, @f TINYINT, @z TINYINT -- < HOW MANY RECORDS WE WANT TO INSERT

WHILE @i  < 80

BEGIN
SET @f = 0 * @i + 3 + (COS(@i * SIN(@i)) * 3) -- I HAVE USED A COS OPERATOR FOR RANDOMIZATION
SET @z = 0 * @i + 1 + (COS(@i * SIN(@i)) * 1)

DECLARE @agent VARCHAR(10) = (SELECT name FROM #A WHERE ID = @f)
DECLARE @estado VARCHAR(10) = (SELECT name FROM #B WHERE ID = @z)
DECLARE @cobrado CHAR(1) = (SELECT name FROM #C WHERE ID = @z)
DECLARE @facturado VARCHAR(10) = (SELECT name FROM #C WHERE ID = @z)
DECLARE @pbook NUMERIC (10,2) = (SELECT ABS(CHECKSUM(NewId())) % 100 + @i)
DECLARE @tipo VARCHAR (10) = (CASE 
			   WHEN @f = 0 THEN 'VUELO'
               WHEN @f > 0 AND @f < 3 THEN 'HOTEL'
			   ELSE 'COCHE'
		       END)

SET @i = @i + 1
EXEC dbo.FILL_RAND_TABLES 'ES',@estado,@agent, @facturado,'Null',@tipo,'IBIS',@pbook,@cobrado
END

DROP TABLE #A,#B, #C


