import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:s_seer_final/constants.dart';
import 'details_page.dart';

class CommonDiseaseSlider extends StatefulWidget {
   const CommonDiseaseSlider({
    super.key, required this.press,
  });
  final Function press;

  @override
  State<CommonDiseaseSlider> createState() => _CommonDiseaseSliderState();
}

class _CommonDiseaseSliderState extends State<CommonDiseaseSlider> {

  List _common = [];
  List _disname = ["COMMON COLD", "CHICKEN POX","DENGUE","JAUNDICE","MALARIA"];
  List symp = ["continuous sneezing, chills, fatigue, cough, high fever, headache, swelled lymph nodes, malaise, phlegm, throat irritation, redness of eyes, sinus pressure, runny nose, congestion, chest pain, loss of smell, muscle pain",
  "itching, skin rash, fatigue, lethargy, high fever, headache, loss of appetite, mild fever,swelled lymph nodes, malaise, red spots over body",
  "skin rash, chills, joint pain, vomiting, fatigue, high fever, headache, nausea, loss of appetite,pain behind the eyes, backpain, muscle pain, red spots over body",
  "itching, vomiting, fatigue, weight loss, high fever, yellowish skin, dark urine, abdominal pain",
  " chills, vomiting, high fever, sweating, headache, nausea, muscle pain"];

@override
void initState() {
    _getThingsOnStartup().then((value){
      print(' Common Async done');
    });
    super.initState();
  }
  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 2));
    readJson();
  }
  Future<void> readJson() async{
    final String response = await rootBundle.loadString("assets/commondata.json");
    final data = await json.decode(response);
    setState((){
      _common=data["common"];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(items: [0,1,2,3,4].map((i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailpage(num: i, name: _common[i]["name"],symptoms: _common[i]["symptoms"],description: _common[i]["description"],  prevention: _common[i]["prevention"],remedies: _common[i]["remedies"],)));      
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(//_common[i]["name"],
                      _disname[i],
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text("Symptoms",overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(20,0,20,20),
                      child: Text(symp[i],overflow: TextOverflow.clip,maxLines: 4,
                      style: TextStyle(fontSize: 18)),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height:  220,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.easeInOut,
        )),
      ],

    );

  }
}