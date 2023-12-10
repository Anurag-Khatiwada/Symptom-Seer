import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';


class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    required this.title,
    required this.press,
    super.key,
  });
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWithUnderline(text: title),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
            onPressed: (){},
            child: Text(" More ",style: TextStyle(color: Colors.white),),)
        ],
      ),
    );
  }
}

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding/4),
            child: Text(text,
            style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),),
          ),
          Positioned(
            bottom: 0,left: 0,right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding/4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.15),)
            ),
        ],
      ),
      
    );
  }
}

