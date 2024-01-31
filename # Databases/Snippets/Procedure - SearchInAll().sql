-- See https://stackoverflow.com/questions/14704105/search-text-in-stored-procedure-in-sql-server
CREATE PROCEDURE [dbo].[SearchInall] (@search AS VARCHAR(MAX))
AS
BEGIN
    SELECT OBJECT_NAME(OBJECT_ID) SP_Name, OBJECT_DEFINITION(OBJECT_ID) SP_Definition FROM sys.procedures WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+@search+'%'  -- Procedures
    SELECT OBJECT_NAME(OBJECT_ID) View_Name, OBJECT_DEFINITION(OBJECT_ID) View_Definition FROM sys.views WHERE  OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+@search+'%' -- Views
    SELECT ROUTINE_NAME Function_Name, ROUTINE_DEFINITION Function_definition FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_DEFINITION LIKE '%'+@search+'%' AND ROUTINE_TYPE = 'FUNCTION' ORDER BY ROUTINE_NAME    -- Functions
    SELECT t.name AS Table_Name, c.name AS COLUMN_NAME FROM sys.tables AS t INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID WHERE c.name LIKE '%'+@search+'%' ORDER BY Table_Name -- Tables
END