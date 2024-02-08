import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:s_seer_final/subjectmodel.dart';

class AppDataController extends GetxController {
  List<SympModel> subjectData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Symptoms lists.",
      "data": [
        {"symid": "abdominal_pain", "symname": "abdominal pain"},
        {"symid": "acidity", "symname": "acidity"},
        {"symid": "back_pain", "symname": "back pain"},
        {"symid": "belly_pain", "symname": "belly pain"},
        {"symid": "blackheads", "symname": "blackheads"},
        {"symid": "blood_in_sputum", "symname": "blood in sputum"},
        {"symid": "bloody_stool", "symname": "bloody stool"},
        {"symid": "blurred_and_distorted_vision", "symname": "blurred and distorted vision"} , 
   	    {"symid": "breathlessness", "symname": "breathlessness"},
        {"symid": "chest_pain", "symname": "chest pain"},
        {"symid": "chills", "symname": "chills"},
        {"symid": "congestion", "symname": "congestion"},
        {"symid": "constipation", "symname": "constipation"},
        {"symid": "continuous_sneezing", "symname": "continuous sneezing"},
        {"symid": "cough", "symname": "cough"},
        {"symid": "dark_urine", "symname": "dark urine"}  ,
   	    {"symid": "dehydration", "symname": "dehydration"},
        {"symid": "depression", "symname": "depression"},
        {"symid": "diarrhoea", "symname": "diarrhoea"},
        {"symid": "excessive_hunger", "symname": "excessive hunger"},
        {"symid": "family_history", "symname": "family history"},
        {"symid": "fast_heart_rate", "symname": "fast heart rate"},
        {"symid": "fatigue", "symname": "fatigue"},
        {"symid": "headache", "symname": "headache"}  ,
	      {"symid": "high_fever", "symname": "high fever"},
        {"symid": "increased_appetite", "symname": "increased appetite"},
        {"symid": "indigestion", "symname": "indigestion"},
        {"symid": "irregular_sugar_level", "symname": "irregular sugar level"},
        {"symid": "irritability", "symname": "irritability"},
        {"symid": "irritation_in_anus", "symname": "irritation in anus"},
        {"symid": "itching", "symname": "itching"}  ,
   	    {"symid": "joint_pain", "symname": "joint pain"},
        {"symid": "lethargy", "symname": "lethargy"},
        {"symid": "loss_of_appetite", "symname": "loss of appetite"},
        {"symid": "loss_of_smell", "symname": "loss of smell"},
        {"symid": "malaise", "symname": "malaise"},
        {"symid": "mild_fever", "symname": "mild fever"},
        {"symid": "movement_stiffness", "symname": "movement stiffness"},
        {"symid": "mucoid_sputum", "symname": "mucoid sputum"}  ,
        {"symid": "muscle_pain", "symname": "muscle pain"},
        {"symid": "muscle_weakness", "symname": "muscle weakness"},
        {"symid": "nausea", "symname": "nausea"},
        {"symid": "obesity", "symname": "obesity"},
        {"symid": "pain_behind_the_eyes", "symname": "pain behind the eyes"},
        {"symid": "pain_during_bowel_movements", "symname": "pain during bowel movements"}  ,
   	    {"symid": "pain_in_anal_region", "symname": "pain in anal region"},
        {"symid": "painful_walking", "symname": "painful walking"},
        {"symid": "phlegm", "symname": "phlegm"},
        {"symid": "polyuria", "symname": "polyuria"},
        {"symid": "pus_filled_pimples", "symname": "pus filled pimples"},
        {"symid": "red_spots_over_body", "symname": "red spots over body"}  ,
   	    {"symid": "redness_of_eyes", "symname": "redness of eyes"},
        {"symid": "restlessness", "symname": "restlessness"},
        {"symid": "runny_nose", "symname": "runny nose"},
        {"symid": "rusty_sputum", "symname": "rusty sputum"},
        {"symid": "scurring", "symname": "scurring"},
        {"symid": "shivering", "symname": "shivering"},
   	    {"symid": "sinus_pressure", "symname": "sinus pressure"},
        {"symid": "skin_rash", "symname": "skin rash"},
        {"symid": "stiff_neck", "symname": "stiff neck"},
        {"symid": "sunken_eyes", "symname": "sunken eyes"},
        {"symid": "sweating", "symname": "sweating"},
        {"symid": "swelled_lymph_nodes", "symname": "swelled lymph nodes"},
        {"symid": "swelling_joints", "symname": "swelling joints"},
        {"symid": "throat_irritation", "symname": "throat irritation"}  ,
   	    {"symid": "toxic_look_(typhos)", "symname": "toxic look (typhos)"},
        {"symid": "visual_disturbances", "symname": "visual disturbances"},
	      {"symid": "vomiting", "symname": "vomiting"},
   	    {"symid": "watering_from_eyes", "symname": "watering from eyes"},
        {"symid": "weight_loss", "symname": "weight loss"},
	      {"symid": "yellowing_of_eyes", "symname": "yellowing of eyes"},
   	    {"symid": "yellowish_skin", "symname": "yellowish skin"}
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SympModel> tempSymData = [];
      apiResponse['data'].forEach(
        (data) {
          tempSymData.add(
            SympModel(
              symId: data['symid'],
              symName: data['symname'],
            ),
          );
        },
      );
      print(tempSymData);
      subjectData.addAll(tempSymData);

      dropDownData = subjectData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.symName);
      }).toList();

      update();
    } else if (apiResponse['code'] == 400) {
      print("Show Error model why error occurred..");
    } else {
      print("show some error model like something went worng..");
    }
  }
}
