// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/dropdownselect.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(height: size.height*0.25,//color: Colors.black,
    child: Stack(
      children: [
        Container(
          height: size.height*0.2-25,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding, bottom: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding,right: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome !", style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),),
                      Text("Predict health, live well.", style: TextStyle(
                        fontSize: 16, color: Colors.white
                      ),),
                    ],
                  ),
                ),
                Spacer(),
              Image.asset("assets/images/banner.png")
              ],
            ),
          ),
        ),
        DropdownSelect(),
      ],
    )
    );
  }
}