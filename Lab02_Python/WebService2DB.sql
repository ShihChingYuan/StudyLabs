/*

EXEC sp_configure 'external scripts enabled'
GO

C:\Program Files\Microsoft SQL Server\MSSQL14.SQLDev2017\PYTHON_SERVICES>

c:\>python -m  pip install --upgrade pip
c:\>python -m  pip install urllib3
c:\>python -m  pip install --upgrade pandas

*/
USE [tempdb]
GO

PRINT N'1. 資料表';
DROP PROCEDURE IF EXISTS [dbo].[usp_PyGet_Table]
GO
CREATE PROCEDURE [dbo].[usp_PyGet_Table]
AS
BEGIN
EXEC sp_execute_external_script
	@language = N'Python'
	, @script = N'
import pandas as pd
from pandas.io.json import json_normalize
df = pd.read_json("http://ihuodong.ntue.edu.tw//api/table")
df_event = json_normalize(json_normalize(df["data"][0])["structure"][0])
df_event["idx"] = "event"
df_apply = json_normalize(json_normalize(df["data"][1])["structure"][0])
df_apply["idx"] = "apply"
df = df_event.append(df_apply)
print(df)
'
	, @output_data_1_name =N'df'
	with result sets(
		(
			[name]		NVARCHAR(32)
			, [note]	NVARCHAR(100)
			, [type]	VARCHAR(32)
			, [idx]		NVARCHAR(32)
		)
	)
END
GO

PRINT N'2. 活動列表';
DROP PROCEDURE IF EXISTS [dbo].[usp_PyGet_EventList]
GO
CREATE PROCEDURE [dbo].[usp_PyGet_EventList]
AS
BEGIN
EXEC sp_execute_external_script
	@language = N'Python'
	, @script = N'
import pandas as pd
from pandas.io.json import json_normalize
df_eventlist = pd.read_json("http://ihuodong.ntue.edu.tw//api/event_list")
JSON_EventList = json_normalize(df_eventlist["data"])
'
	, @output_data_1_name =N'JSON_EventList'
	with result sets(
		(
			[classify]		NVARCHAR(32)
			, [deadline]	DATETIME
			, [end_date]	DATE
			, [end_time]	TIME
			, [id]			INT
			, [link]		NVARCHAR(1000)
			, [location]	NVARCHAR(500)
			, [organizer]	NVARCHAR(100)
			, [speaker]		NVARCHAR(100)
			, [start_date]	DATE
			, [start_time]	TIME
			, [status]		VARCHAR(100)
			, [subject]		NVARCHAR(100)
			, [type]		INT
		)
	)
END
GO

PRINT N'3. 報名資料';
DROP PROCEDURE IF EXISTS [dbo].[usp_PyGet_ApplyList]
GO
CREATE PROCEDURE [dbo].[usp_PyGet_ApplyList]
AS
BEGIN
EXEC sp_execute_external_script
	@language = N'Python'
	, @script = N'
import pandas as pd
from pandas.io.json import json_normalize
df = pd.read_json("http://ihuodong.ntue.edu.tw//api/apply_list")
df_apply = json_normalize(df["data"])
print(df)
print(df_apply)
print(df_apply.columns)
'
	, @output_data_1_name =N'df_apply'
	with result sets(
		(
			[classify]		NVARCHAR(32)
			, [date]		DATE
			, [id]			INT
			, [location]	NVARCHAR(500)
			, [sn]			NVARCHAR(100)
			, [start_time]	TIME
			, [subject]		NVARCHAR(100)
			, [type]		INT
			, [username]	NVARCHAR(100)
		)
	)
END
GO

PRINT N'4. 活動類型列表';
DROP PROCEDURE IF EXISTS [dbo].[usp_PyGet_ClassifyList]
GO
CREATE PROCEDURE [dbo].[usp_PyGet_ClassifyList]
AS
BEGIN
EXEC sp_execute_external_script
	@language = N'Python'
	, @script = N'
import pandas as pd
df_classifylist = pd.read_json("http://ihuodong.ntue.edu.tw//api/classify_list")
df_classifylist_event = pd.DataFrame(df_classifylist["data"]["活動"], columns=["data"])
df_classifylist_event["classify"] = "活動"
df_classifylist_speech = pd.DataFrame(df_classifylist["data"]["演講"], columns=["data"])
df_classifylist_speech["classify"] = "演講"
df = df_classifylist_event.append(df_classifylist_speech)
print(df)
'
	, @output_data_1_name =N'df'
	with result sets(
		(
			[data]			NVARCHAR(100)
			, [classify]	NVARCHAR(32)
		)
	)
END
GO

/*

--1. 資料表
--	http://ihuodong.ntue.edu.tw/api/table
EXEC [dbo].[usp_PyGet_Table];

--2. 活動列表
--	http://ihuodong.ntue.edu.tw//api/event_list
EXEC [dbo].[usp_PyGet_EventList];

--3. 報名資料
--	http://ihuodong.ntue.edu.tw//api/apply_list
EXEC [dbo].[usp_PyGet_ApplyList];

--4. 活動類型列表
--	http://ihuodong.ntue.edu.tw//api/classify_list
EXEC [dbo].[usp_PyGet_ClassifyList];

*/