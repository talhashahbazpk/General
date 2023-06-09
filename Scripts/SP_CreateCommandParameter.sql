USE [Unique_Test]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateCommandParameter]    Script Date: 12/29/2021 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_CreateCommandParameter]
	@Table NVARCHAR(100),
	@Object NVARCHAR(100)	
AS
BEGIN
	declare @TableName sysname = @Table
	declare @Result varchar(max) = '	SqlParameter[] parameters = {'

	select @Result = @Result + 'new SqlParameter("@' + ColumnName + '", ' + @Object + '.' + ColumnName +'),' + '
	'
	from
	(
		select 
			replace(col.name, ' ', '_') ColumnName,
			column_id ColumnId
		from sys.columns col
			join sys.types typ on
				col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
		where object_id = object_id(@TableName)
	) t
	order by ColumnId

	set @Result = @Result  + '};'

	print @Result
END

