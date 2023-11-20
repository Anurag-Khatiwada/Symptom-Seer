import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(height: size.height*0.25,
    child: Stack(
      children: [
        Container(
          height: size.height*0.2-27,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,bottom: 30),
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
              ),Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset("assets/images/banner.png"),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 30,left: 0,right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(27),
            boxShadow: [BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 30,
              color: kPrimaryColor.withOpacity(0.3)
            )]
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Symptoms",
                    hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/search.svg")
            ],
          ),
        ))
      ],
    ));
  }
}