/* Step 0 (if needed) */
/* Install AccessDatabaseEngine */

/* Step 1 */
/*Run SQL as Administrator */

/* Step 2 */
--sp_configure 'show advanced options', 1;
--RECONFIGURE;
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;
--GO

/* Step 3 */
--EXEC sp_MSSet_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
--GO
--EXEC sp_MSSet_oledb_prop N'Microsoft.ACE.OLEDB.12.0',
--                         N'DynamicParameters',
--                         1
--GO
/* Step 4 */
/* Read & INSERT */
INSERT INTO tbl_Def_Gender
SELECT *
FROM
    OPENROWSET('Microsoft.ACE.OLEDB.12.0',
               'Excel 12.0;Database=E:\Documents\Cothm\Gender.xlsx',
               'SELECT * FROM [Sheet1$]'
              );