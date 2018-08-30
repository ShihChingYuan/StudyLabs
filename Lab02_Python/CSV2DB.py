# Change to Python 3.7.0
# pip3 install pandas in Terminal mode
# configure Debug settings "Python : Current File"
# ref : https://code.visualstudio.com/docs/python/python-tutorial
import pandas as pd

df = pd.read_csv("D:/GitHub/StudyLabs/Lab02_Python/1535595103_72.csv")
df["_raw_split"] = df["_raw"].str.find("]:")+2
df["_raw_len"] = df["_raw"].str.len()
df["_raw"] = df["_raw"].str[70:214] #<--- need to fix
print(df[["_time", "index","name", "pid", "process", "source", "_raw", "_raw_len", "_raw_split"]])

