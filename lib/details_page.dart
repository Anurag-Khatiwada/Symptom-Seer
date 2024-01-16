import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';

class Detailpage extends StatelessWidget{
Detailpage({super.key, required this.num, required this.name, required this.symptoms, required this.description, required this.prevention,required this.remedies});

int num;
String name;
String symptoms;
String description;
String prevention;
String remedies;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Container(
            height: size.height*0.95,
            width: size.width*0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0,30,10,20),
                      child: Text(name,
                                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text("Symptoms",textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,10),
                      child: Text(symptoms,textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text("Description",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0,10,10,10),
                      child: Text(description,textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text("Prevention",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0,10,10,0),
                      child: Text(prevention,textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text("Remedies",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0,10,10,30),
                      child: Text(remedies,textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
          ),
        ),
      )
    );
  }
}