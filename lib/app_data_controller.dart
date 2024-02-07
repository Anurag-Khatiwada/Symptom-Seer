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
        {"symid": "abdominal_pain", "symname": "pain behind the eyes"},
        {"symid": "acidity", "symname": "sunken eyes"},
        {"symid": "back_pain", "symname": "movement stiffness"},
        {"symid": "belly_pain", "symname": "family history"},
        {"symid": "blackheads", "symname": "dark urine"},
        {"symid": "blood_in_sputum", "symname": "continuous sneezing"},
        {"symid": "bloody_stool", "symname": "abdominal pain"},
        {"symid": "blurred_and_distorted_vision", "symname": "redness of eyes"} , 
   	    {"symid": "breathlessness", "symname": "irritation in anus"},
        {"symid": "chest_pain", "symname": "pus filled pimples"},
        {"symid": "chills", "symname": "chest pain"},
        {"symid": "congestion", "symname": "vomiting"},
        {"symid": "constipation", "symname": "depression"},
        {"symid": "continuous_sneezing", "symname": "polyuria"},
        {"symid": "cough", "symname": "chills"},
        {"symid": "dark_urine", "symname": "constipation"}  ,
   	    {"symid": "dehydration", "symname": "dehydration"},
        {"symid": "depression", "symname": "painful walking"},
        {"symid": "diarrhoea", "symname": "restlessness"},
        {"symid": "excessive_hunger", "symname": "vomiting"},
        {"symid": "family_history", "symname": "increased appetite"},
        {"symid": "fast_heart_rate", "symname": "shivering"},
        {"symid": "fatigue", "symname": "irritability"},
        {"symid": "headache", "symname": "sweating"}  ,
	      {"symid": "high_fever", "symname": "belly pain"},
        {"symid": "increased_appetite", "symname": "blackheads"},
        {"symid": "indigestion", "symname": "skin rash"},
        {"symid": "irregular_sugar_level", "symname": "high fever"},
        {"symid": "irritability", "symname": "yellowing of eyes"},
        {"symid": "irritation_in_anus", "symname": "headache"},
        {"symid": "itching", "symname": "muscle weakness"}  ,
   	    {"symid": "joint_pain", "symname": "throat irritation"},
        {"symid": "lethargy", "symname": "weight loss"},
        {"symid": "loss_of_appetite", "symname": "abdominal pain"},
        {"symid": "loss_of_smell", "symname": "visual disturbances"},
        {"symid": "malaise", "symname": "red spots over body"},
        {"symid": "mild_fever", "symname": "fatigue"},
        {"symid": "movement_stiffness", "symname": "scurring"},
        {"symid": "mucoid_sputum", "symname": "nausea"}  ,
        {"symid": "muscle_pain", "symname": "yellowish skin"},
        {"symid": "muscle_weakness", "symname": "muscle pain"},
        {"symid": "nausea", "symname": "toxic look (typhos)"},
        {"symid": "obesity", "symname": "swelling joints"},
        {"symid": "pain_behind_the_eyes", "symname": "excessive hunger"},
        {"symid": "pain_during_bowel_movements", "symname": "cough"}  ,
   	    {"symid": "pain_in_anal_region", "symname": "lethargy"},
        {"symid": "painful_walking", "symname": "obesity"},
        {"symid": "phlegm", "symname": "irregular sugar level"},
        {"symid": "polyuria", "symname": "mucoid sputum"},
        {"symid": "pus_filled_pimples", "symname": "indigestion"},
        {"symid": "red_spots_over_body", "symname": "loss of smell"}  ,
   	    {"symid": "redness_of_eyes", "symname": "sinus pressure"},
        {"symid": "restlessness", "symname": "congestion"},
        {"symid": "runny_nose", "symname": "bloody stool"},
        {"symid": "rusty_sputum", "symname": "nausea"},
        {"symid": "scurring", "symname": "fast heart rate"},
        {"symid": "shivering", "symname": "acidity"},
   	    {"symid": "sinus_pressure", "symname": "loss of appetite"},
        {"symid": "skin_rash", "symname": "rusty sputum"},
        {"symid": "stiff_neck", "symname": "diarrhoea"},
        {"symid": "sunken_eyes", "symname": "blurred and distorted vision"},
        {"symid": "sweating", "symname": "runny nose"},
        {"symid": "swelled_lymph_nodes", "symname": "pain in anal region"},
        {"symid": "swelling_joints", "symname": "phlegm"},
        {"symid": "throat_irritation", "symname": "itching"}  ,
   	    {"symid": "toxic_look_(typhos)", "symname": "pain during bowel movements"},
        {"symid": "visual_disturbances", "symname": "joint pain"},
	      {"symid": "vomiting", "symname": "watering from eyes"},
   	    {"symid": "watering_from_eyes", "symname": "blood in sputum"},
        {"symid": "weight_loss", "symname": "joint pain"},
	      {"symid": "yellowing_of_eyes", "symname": "watering from eyes"},
   	    {"symid": "yellowish_skin", "symname": "blood in sputum"}
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
