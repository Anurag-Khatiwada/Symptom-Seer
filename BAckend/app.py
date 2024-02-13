from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
app = Flask(__name__)

# @app.route('/',methods=['GET'])
# def home():
#     app.run(host='0.0.0.0', port=5000)
#     return 'Hello World!'



@app.route('/receive-json', methods=['POST'])
def receive_json():
    try:
        # Check if the request has JSON data
        if request.is_json:
            data = request.get_json()
            
            # Process the JSON data
            # For example, print it to the console
            print('Received JSON:', data)
        
            # You can perform additional processing or validation here
            df3 = pd.read_csv("E:\Flutter\s_seer_final\Backend\Training.csv", usecols=['pain_behind_the_eyes',
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
            df_filtered=df_filtered.drop_duplicates()
            df_sorted_columns = df_filtered.sort_index(axis=1)
            X= df_sorted_columns.drop(columns=['prognosis'])
            y= df_sorted_columns['prognosis']
            # train test split
            from sklearn.model_selection import train_test_split
            # label encoder
            from sklearn.preprocessing import LabelEncoder
            le = LabelEncoder()
            y = le.fit_transform(y)
            X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=45)
            #decision tree classifier
            from sklearn.tree import DecisionTreeClassifier
            from sklearn.ensemble import RandomForestClassifier
            dtc = RandomForestClassifier()
            dtc.fit(X_train, y_train)
            cols=list(df_sorted_columns.columns)
            cols.remove('prognosis')
            import json
            symp_name=(data)
            print(type(data))
            print(symp_name)
            print(type(symp_name))
            # x=0
            # while True:

            #     n=input('Enter the symptoms')
            #     if(n== 'stop'):
            #         break
            #     symp_name.append(n)
            #     x+=1
            # symp_name.sort()
            # print(x)


            dis=[1 if i in symp_name else 0 for i in cols]
            # def reta(x,num=0):

            #     for i in cols:
            #         if(i ==  symp_name[num]):
            #             print('you have entered ' + symp_name[num])
            #             dis.append(1)

            #             x-=1
            #             if x==0:
            #                 x=0
            #             else:
            #                 num+=1
            #         else: 
            #             dis.append(0)
            # reta(x)
            dis=np.array(dis).reshape(1,-1)
            # dis=dis.reshape([1,72])
            predicted_dtc=dtc.predict(dis)
            predicted_disease=le.inverse_transform(predicted_dtc)
            print("predicted_disease: ",predicted_disease[0])

            data=pd.read_csv("E:\Flutter\s_seer_final\Backend\Symptom_severity.csv")
            sum=0
            for index,symptom in enumerate(data["symptoms"]):
                if symptom in symp_name:
                    sum=sum+data["severity"][index]
            print(sum)
            
            sum=0
            count=0
            for index,symptom in enumerate(data["symptoms"]):
                if symptom in symp_name:
                    if(data['severity'][index]>5):
                        count=count+1
                    sum=sum+data["severity"][index]

            print(sum)

            sevm=sum/len(symp_name)

            if(count>=2):
                sev='It might be highly severe.'
                print('severe')
            elif sevm<=3:
                sev='It might be mildly severe.'
                print("mild")
            elif sevm<=6:
                sev='It might be moderately severe.'
                print("moderate")
            else:
                sev='It might be highly severe.'
                print('severe')
            
            # sev=sum/len(symp_name)

            # if sev<=3:
            #     sev='It might be mildly severe.'
            #     print("mild")
            # elif sev<=5:
            #     sev='It might be moderately severe.'
            #     print("moderate")
            # else:
            #     sev='It might be highly severe.'
            #     print("severe")
    
            # print(predicteddtc)
            # print(le.inverse_transform(dtc.predict(dis)))
            # print(type(le.inverse_transform(dtc.predict(dis))))
            
            return jsonify({'status': 'success', 'message': predicted_disease[0],'sev':sev})
        else:
            return jsonify({'status': 'error', 'message': 'No JSON data received'}), 400

    except Exception as e:
        print(f"Error processing JSON data: {e}")
        return jsonify({'status': 'error', 'message': 'Internal server error'}), 500

if __name__ == '__main__':
    app.run(debug=True) 
