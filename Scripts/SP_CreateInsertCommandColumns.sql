USE [Unique_Test]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateInsertCommandColumns]    Script Date: 12/29/2021 10:43:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_CreateInsertCommandColumns]
	@Table NVARCHAR(100)	
AS
BEGIN
	declare @TableName sysname = @Table
	declare @Result varchar(max) = ''

	select @Result = @Result + ColumnName +',
	'
	from
	(
		select 
			replace(col.name, ' ', '_') ColumnName,
			column_id ColumnId,
			case when typ.name IN ('char','nchar','varchar','nvarchar','text','ntext') then typ.name + '(' + CAST(col.max_length AS VARCHAR(10)) + ')'
				else typ.name
			end ColumnType
		from sys.columns col
			join sys.types typ on
				col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
		where object_id = object_id(@TableName)
	) t
	order by ColumnId

	set @Result = @Result

	print @Result

	SET @Result = ''

	select @Result = @Result + '@' + ColumnName + ',
	'
	from
	(
		select 
			replace(col.name, ' ', '_') ColumnName,
			column_id ColumnId,
			case when typ.name IN ('char','nchar','varchar','nvarchar','text','ntext') then typ.name + '(' + CAST(col.max_length AS VARCHAR(10)) + ')'
				else typ.name
			end ColumnType
		from sys.columns col
			join sys.types typ on
				col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
		where object_id = object_id(@TableName)
	) t
	order by ColumnId

	set @Result = @Result

	print @Result
END

