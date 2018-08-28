# Change to Python 3.7.0
# pip3 install pandas in Terminal mode
# configure Debug settings "Python : Current File"
# ref : https://code.visualstudio.com/docs/python/python-tutorial
import pandas as pd
from pandas.io.json import json_normalize

df = pd.read_json('https://anbon.works/ntue_activity/api/table')

# print(df.columns)
# print(df['data'][0]) #event
# print(df['data'][1]) #apply
JSONStruct_Event = json_normalize(json_normalize(df['data'][0])['structure'][0])
JSONStruct_Apply = json_normalize(json_normalize(df['data'][1])['structure'][0])
print(JSONStruct_Event)
print(JSONStruct_Event.index)
print(JSONStruct_Apply)
print(JSONStruct_Apply.index)
