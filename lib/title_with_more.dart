import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: SizedBox(
        height: 24,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding/4),
              child: Text(text,
              style: TextStyle(fontSize: 23,
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
        
      ),
    );
  }
}

