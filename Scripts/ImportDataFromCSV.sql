GO
BULK INSERT dbo.tbl_Def_Gender FROM 'C:\Users\CAS-Designer\Desktop\ImportGender.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);
GO