// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'title_with_more.dart';
import 'header_with_search_bar.dart';
import 'common_disease_slider.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithUnderline(text: "Common Diseases"),
          CommonDiseaseSlider(press: ()=>{}),
        ],
      ),
    );
  }
}

