import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:s_seer_final/app_data_controller.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/homescreen.dart';
import 'package:s_seer_final/subjectmodel.dart';

class DropdownSelect extends StatefulWidget {
  DropdownSelect({super.key, });

  @override
  State<DropdownSelect> createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {
  final AppDataController controller=Get.put(AppDataController());

  @override
  Widget build(BuildContext context) {
    List subjectData =[];
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {controller.getSubjectData();});
    return Positioned(
      bottom: 20,left: 0,right: 0, 
      child: Column(
          children: [
            GetBuilder<AppDataController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,10),
                child: MultiSelectDialogField(
                  dialogHeight: 200,
                  searchable: true,
                  items: controller.dropDownData,title: const Text("Select Symptoms",style: TextStyle(color: Colors.black,fontSize: 17),),
                  selectedColor: Colors.black,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(27),
                  border: Border.all(color: Colors.white)
                  ),
                  buttonIcon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                  buttonText: const Text("Search Symptoms",
                  style: TextStyle(color: Colors.black, fontSize: 17),),
                  onConfirm: (results) {
                    subjectData=[];
                    for (var i = 0; i < results.length; i++) {
                      SympModel data = results[i] as SympModel;
                      print(data.symId);
                      print(data.symName);
                      subjectData.add(data.symId);
                    }
                    print("data $subjectData");
                    if (results.length<4 && results.length!=0)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              SizedBox(width: 30,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text("Oh Snap!",style: TextStyle(fontSize: 18,color: Colors.black),),
                                    Spacer(),
                                    Text("Atleast enter 4 different symptoms.",
                                          style: TextStyle(color: Colors.black,fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                          height: 90,
                          decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(10)),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        )
                        );
                      subjectData.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));      
                    }
                    else{
                      //request api and get data here

                    }
                  },
                  
                  chipDisplay: MultiSelectChipDisplay.none(),
                ),
                
              );
            }),
          ],
        ),
    );
  }
}
