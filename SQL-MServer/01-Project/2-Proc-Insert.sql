USE [SQLSERVERDB]
GO

CREATE PROCEDURE dbo.FILL_RAND_TABLES

  @web VARCHAR (2)
, @estado VARCHAR (10)

, @agent VARCHAR (50) 
, @facturado CHAR(1)
, @error VARCHAR (100)

,@tipo VARCHAR (10)
,@prov VARCHAR (10)
,@priceEU NUMERIC (10, 2)
,@cobrado CHAR(1)

AS
BEGIN
DECLARE @reserva_ID NUMERIC (12,0)  
SET @reserva_id = (SELECT COUNT(ID + 1) FROM [dbo].[RESERVA])
DECLARE @PROD_ID NUMERIC(12,0)
SET @PROD_ID =  (SELECT COUNT(ID + 1) FROM [dbo].[PRODUCTO])


INSERT INTO [dbo].[RESERVA]
           ([ID]
           ,[TIMESTAMP_]
           ,[WEBSITE]
           ,[ESTADO])
     VALUES
           (@reserva_ID
		   ,GETDATE()
           ,@web
           ,@estado)



INSERT INTO [dbo].[FINANZAS]
           (RESERVA_ID, AGENTE_ASIGNADO, FACTURADO, ERROR)
     VALUES
           (@reserva_ID
           ,@agent
           ,@facturado
           ,@error)


INSERT INTO [dbo].[PRODUCTO]
           ([ID]
           ,[RESERVA_ID]
           ,[TIPO]
           ,[PROVEEDOR]
           ,[PRECIO_EN_EUR]
           ,[COBRADO])
     VALUES
           ((SELECT COUNT(ID + 1) FROM [dbo].[PRODUCTO])
           ,@reserva_ID
           ,@tipo
           ,@prov
           ,@priceEU
           ,@cobrado)

END