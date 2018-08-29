/*

EXEC sp_configure 'external scripts enabled'
GO

C:\Program Files\Microsoft SQL Server\MSSQL14.SQLDev2017\PYTHON_SERVICES>

c:\>python -m  pip install --upgrade pip
c:\>python -m  pip install urllib3
c:\>python -m  pip install --upgrade pandas

*/

IF OBJECT_ID('tempdb..#tbEvents') IS NOT NULL
DROP TABLE #tbEvents;
GO
CREATE TABLE #tbEvents
(
	[name] nvarchar(max)
	, [note] nvarchar(max)
	, [type] nvarchar(max)
);
GO

--Index(['data', 'msg', 'status'], dtype='object')
	--'data' --> Index(['name', 'note', 'type'], dtype='object')

DROP PROCEDURE IF EXISTS [dbo].[usp_PyGetWS]
GO
CREATE PROCEDURE [dbo].[usp_PyGetWS]
AS
BEGIN
EXEC sp_execute_external_script
	@language = N'Python'
	, @script = N'
import pandas as pd
from pandas.io.json import json_normalize
df = pd.read_json("https://anbon.works/ntue_activity/api/table")
JSONStruct_Event = json_normalize(json_normalize(df["data"][0])["structure"][0])
JSONStruct_Apply = json_normalize(json_normalize(df["data"][1])["structure"][0])
x = JSONStruct_Event.append(JSONStruct_Apply)
# print(JSONStruct_Event.columns)
print(JSONStruct_Event)
# print(JSONStruct_Apply.columns)
print(JSONStruct_Apply)
'
	, @output_data_1_name =N'x'
	with result sets(
		(
			[name] nvarchar(max)
			, [note] nvarchar(max)
			, [type] nvarchar(max)
		)
	)
END
GO
/*

	INSERT INTO #tbEvents
	EXEC [dbo].[usp_PyGetWS];

	SELECT * FROM #tbEvents;

*/
