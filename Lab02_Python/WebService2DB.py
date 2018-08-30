# Change to Python 3.7.0
# pip3 install pandas in Terminal mode
# configure Debug settings "Python : Current File"
# ref : https://code.visualstudio.com/docs/python/python-tutorial
import pandas as pd
from pandas.io.json import json_normalize

df = pd.read_json("https://anbon.works/ntue_activity/api/table")
df_eventlist = pd.read_json("https://anbon.works/ntue_activity/api/event_list")
df_eventapply = pd.read_json("https://anbon.works/ntue_activity/api/apply_list")
df_classifylist = pd.read_json("https://anbon.works/ntue_activity/api/classify_list")

df_classifylist_event = pd.DataFrame(df_classifylist["data"]["活動"], columns=['data'])
df_classifylist_event["classify"] = "活動"
df_classifylist_speech = pd.DataFrame(df_classifylist["data"]["演講"], columns=['data'])
df_classifylist_speech["classify"] = "演講"
df = df_classifylist_event.append(df_classifylist_speech)
print(df)

# JSON_EventList = json_normalize(df_eventlist["data"])
# print(df_eventlist)
# print(df_eventlist.columns)
# print(JSON_EventList)
# print(type(JSON_EventList))

# JSON_EventApply = json_normalize(df_eventapply["data"][0])
# print(df_eventapply)
# print(df_eventapply.columns)
# print(JSON_EventApply)

# print(df.columns)
# print(df["data"][0]) #event
# print(df["data"][1]) #apply
# JSONStruct_Event = json_normalize(json_normalize(df["data"][0])["structure"][0])
# JSONStruct_Apply = json_normalize(json_normalize(df["data"][1])["structure"][0])
# print(JSONStruct_Event)
# print(JSONStruct_Event.index)
# print(JSONStruct_Apply)
# print(JSONStruct_Apply.index)
