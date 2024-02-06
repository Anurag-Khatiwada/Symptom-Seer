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
      "data": [	  {"symid": "0", "symname": "pain behind the eyes"},
        {"symid": "1", "symname": "sunken eyes"},
        {"symid": "2", "symname": "movement stiffness"},
        {"symid": "3", "symname": "family history"},
        {"symid": "4", "symname": "dark urine"},
        {"symid": "5", "symname": "continuous sneezing"},
        {"symid": "6", "symname": "abdominal pain"},
        {"symid": "7", "symname": "redness of eyes"},
        {"symid": "8", "symname": "irritation in anus"},
        {"symid": "9", "symname": "pus filled pimples"},
        {"symid": "10", "symname": "chest pain"},
        {"symid": "11", "symname": "vomiting"},
        {"symid": "12", "symname": "depression"},
        {"symid": "13", "symname": "polyuria"},
        {"symid": "14", "symname": "chills"},
        {"symid": "15", "symname": "constipation"},
        {"symid": "16", "symname": "dehydration"},
        {"symid": "17", "symname": "painful walking"},
        {"symid": "18", "symname": "restlessness"},
        {"symid": "19", "symname": "vomiting"},
        {"symid": "20", "symname": "increased appetite"},
        {"symid": "21", "symname": "shivering"},
        {"symid": "22", "symname": "irritability"},
        {"symid": "23", "symname": "sweating"},
        {"symid": "24", "symname": "belly pain"},
        {"symid": "25", "symname": "blackheads"},
        {"symid": "26", "symname": "mild fever"},
        {"symid": "27", "symname": "skin rash"},
        {"symid": "28", "symname": "high fever"},
        {"symid": "29", "symname": "yellowing of eyes"},
        {"symid": "30", "symname": "headache"},
        {"symid": "31", "symname": "muscle weakness"},
        {"symid": "32", "symname": "throat irritation"},
        {"symid": "33", "symname": "weight loss"},
        {"symid": "34", "symname": "abdominal pain"},
        {"symid": "35", "symname": "visual disturbances"},
        {"symid": "36", "symname": "red spots over body"},
        {"symid": "37", "symname": "fatigue"},
        {"symid": "38", "symname": "scurring"},
        {"symid": "39", "symname": "nausea"},
        {"symid": "40", "symname": "weight loss"},
        {"symid": "41", "symname": "yellowish skin"},
        {"symid": "42", "symname": "malaise"},
        {"symid": "43", "symname": "muscle pain"},
        {"symid": "44", "symname": "toxic look (typhos)"},
        {"symid": "45", "symname": "swelling joints"},
        {"symid": "46", "symname": "excessive hunger"},
        {"symid": "47", "symname": "cough"},
        {"symid": "48", "symname": "lethargy"},
        {"symid": "49", "symname": "obesity"},
        {"symid": "50", "symname": "breathlessness"},
        {"symid": "51", "symname": "irregular sugar level"},
        {"symid": "52", "symname": "mucoid sputum"},
        {"symid": "53", "symname": "back pain"},
        {"symid": "54", "symname": "indigestion"},
        {"symid": "55", "symname": "loss of smell"},
        {"symid": "56", "symname": "sinus pressure"},
        {"symid": "57", "symname": "congestion"},
        {"symid": "58", "symname": "bloody stool"},
        {"symid": "59", "symname": "nausea"},
        {"symid": "60", "symname": "swelled lymph nodes"},
        {"symid": "61", "symname": "fast heart rate"},
        {"symid": "62", "symname": "acidity"},
        {"symid": "63", "symname": "stiff neck"},
   	    {"symid": "64", "symname": "loss of appetite"},
        {"symid": "65", "symname": "rusty sputum"},
        {"symid": "66", "symname": "diarrhoea"},
        {"symid": "67", "symname": "blurred and distorted vision"},
        {"symid": "68", "symname": "runny nose"},
        {"symid": "69", "symname": "pain in anal region"},
        {"symid": "70", "symname": "phlegm"},
        {"symid": "71", "symname": "itching"},
   	    {"symid": "72", "symname": "pain during bowel movements"},
        {"symid": "73", "symname": "joint pain"},
	      {"symid": "74", "symname": "watering from eyes"},
   	    {"symid": "75", "symname": "blood in sputum"},
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
