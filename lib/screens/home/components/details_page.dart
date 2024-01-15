import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';

class Detailpage extends StatelessWidget{
const Detailpage({super.key, required this.num});

final int num;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Disease $num",
                                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,10),
                      child: Text("Symptoms: dsadasdasd, asdasdas, asdasdas,fgdsgdfg, dfgdfg ",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10.0,10,10,10),
                      child: Text("This is a description for the disease which is opened from the homepage. ",
                            style: TextStyle(fontSize: 22)),
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