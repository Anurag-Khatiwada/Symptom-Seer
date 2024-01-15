import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:s_seer_final/constants.dart';
import 'details_page.dart';

class CommonDiseaseSlider extends StatelessWidget {
  const CommonDiseaseSlider({
    super.key, required this.press,
  });
  final Function press;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(items: [0,1,2,3,4].map((i) {
          return GestureDetector(
            onTap:() => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailpage(num: i)))
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Text $i",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("This is the portion where a short Description will be given of Text $i",
                    style: TextStyle(fontSize: 18),),
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
