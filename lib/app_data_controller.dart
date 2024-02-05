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
        {"symid": "1", "symname": "English"},
        {"symid": "2", "symname": "Physics"},
        {"symid": "3", "symname": "Chemistry"},
        {"symid": "4", "symname": "Geography"},
        {"symid": "5", "symname": "Math"},
        {"symid": "6", "symname": "History"},
        {"symid": "7", "symname": "Computer Science"},
        {"symid": "8", "symname": "Arts"}
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
