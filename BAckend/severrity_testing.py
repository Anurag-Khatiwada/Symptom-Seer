import numpy as np
import pandas as pd

df=pd.read_csv("E:\Flutter\s_seer_final\Backend\Symptom_severity.csv",names=['symptom','severity'])
print(df['severity'].value_counts())