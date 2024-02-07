
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
df3 = pd.read_csv("Training.csv", usecols=['pain_behind_the_eyes',
 'sunken_eyes',
 'movement_stiffness',
 'family_history',
 'dark_urine',
 'continuous_sneezing',
 'abdominal_pain',
 'redness_of_eyes',
 'irritation_in_anus',
 'pus_filled_pimples',
 'chest_pain',
 'vomiting',
 'depression',
 'polyuria',
 'chills',
 'constipation',
 'dehydration',
 'painful_walking',
 'restlessness',
 'vomiting',
 'increased_appetite',
 'shivering',
 'irritability',
 'sweating',
 'belly_pain',
 'blackheads',
 'mild_fever',
 'skin_rash',
 'high_fever','yellowing_of_eyes',
 'headache',
 'muscle_weakness',
 'throat_irritation',
 'weight_loss',
 'abdominal_pain',
 'visual_disturbances',
 'red_spots_over_body',
 'fatigue',
 'scurring',
 'nausea',
 'weight_loss',
 'yellowish_skin',
 'malaise',
 'muscle_pain',
 'toxic_look_(typhos)',
 'swelling_joints',
 'excessive_hunger',
 'cough',
 'lethargy',
 'obesity',
 'breathlessness',
 'irregular_sugar_level',
 'mucoid_sputum',
 'back_pain',
 'indigestion',
 'loss_of_smell',
 'sinus_pressure',
 'congestion',
 'bloody_stool',
 'nausea',
 'swelled_lymph_nodes',
 'fast_heart_rate',
 'acidity',
 'stiff_neck',
 'loss_of_appetite',
 'rusty_sputum',
 'diarrhoea',
 'blurred_and_distorted_vision',
 'runny_nose',
 'pain_in_anal_region',
 'phlegm',
 'itching',
 'pain_during_bowel_movements',
 'joint_pain',
 'watering_from_eyes',
 'blood_in_sputum',
 'prognosis'])

disease= ['Acne', 'Allergy', 'Common Cold', 'Chicken pox', 'Dengue','Diabetes ', 'Jaundice', 'Malaria', 'Pneumonia', 'Tuberculosis','Typhoid','Gastroenteritis','Migraine','Arthritis','Bronchial Asthma']
df_filtered = df3[df3['prognosis'].str.contains('|'.join(disease))]

df_sorted_columns = df_filtered.sort_index(axis=1)
X= df_sorted_columns.drop(columns=['prognosis'])
y= df_sorted_columns['prognosis']
# train test split
from sklearn.model_selection import train_test_split
# label encoder
from sklearn.preprocessing import LabelEncoder
le = LabelEncoder()
y = le.fit_transform(y)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
#decision tree classifier
from sklearn.tree import DecisionTreeClassifier
dtc = DecisionTreeClassifier()
dtc.fit(X_train, y_train)
cols=list(df_sorted_columns.columns)
cols.remove('prognosis')

symp_name=['joint_pain','back_pain','nausea','dark_urine']
x=0
# while True:
    
#     n=input('Enter the symptoms')
#     if(n== 'stop'):
#         break
#     symp_name.append(n)
#     x+=1
# symp_name.sort()
# print(x)


dis=[]
def reta(x,num=0):
    
    for i in cols:
        if(i ==  symp_name[num]):
            print('you have entered ' + symp_name[num])
            dis.append(1)
            
            x-=1
            if x==0:
                x=0
            else:
                num+=1
        else: 
            dis.append(0)
reta(x)
dis=np.array(dis)
dis=dis.reshape([1,72])
predicteddtc=dtc.predict(dis)
print(predicteddtc)
print(le.inverse_transform(dtc.predict(dis)))

