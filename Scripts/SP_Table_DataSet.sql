USE [Unique_Test]
GO
/****** Object:  StoredProcedure [dbo].[SP_Table_DataSet]    Script Date: 12/29/2021 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Table_DataSet]  
	@Table NVARCHAR(100),
	@Object NVARCHAR(100)	
AS  
BEGIN  
	
	Print '--------------------------------------- model Class ---------------------------------------';
	EXEC SP_CreateModelClass @Table;
	
	Print '--------------------------------------- Command Parameter ---------------------------------------';
	EXEC SP_CreateCommandParameter @Table, @Object;
	
	Print '--------------------------------------- Define column ---------------------------------------';
	EXEC SP_CreateInsertParameter @Table;
	
	Print '--------------------------------------- column for insert and select ---------------------------------------';
	EXEC SP_CreateInsertCommandColumns @Table;
	
	Print '--------------------------------------- update command ---------------------------------------';
	EXEC SP_CreateUpdateParameter @Table;
END