// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

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
        
        Positioned(
          bottom: 20,left: 0,right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MultiSelectDropDown(
                  padding: EdgeInsets.all(10),
                  showClearIcon: true,
                  borderWidth: 0,
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },hint: "Select Symptoms",borderRadius: 27,
                  options: const <ValueItem>[
                    ValueItem(label: 'Option 1', value: '1'),
                    ValueItem(label: 'Option 2', value: '2'),
                    ValueItem(label: 'Option 3', value: '3'),
                    ValueItem(label: 'Option 4', value: '4'),
                    ValueItem(label: 'Option 5', value: '5'),
                    ValueItem(label: 'Option 6', value: '6'),
                    ValueItem(label: 'Option 7', value: '7'),
                    ValueItem(label: 'Option 8', value: '8'),
                    ValueItem(label: 'Option 9', value: '9'),
                    ValueItem(label: 'Option 0', value: '0'),
                  ],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 500,
                  optionTextStyle: const TextStyle(fontSize: 12),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                  searchEnabled: true,
                  searchLabel: ("Search Symptoms"),
                ),
            
          ),
           /*Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 83, 18, 18),
            borderRadius: BorderRadius.circular(27),
            boxShadow: [BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 20,
              color: kPrimaryColor.withOpacity(0.2)
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: SvgPicture.asset("assets/icons/search.svg"),
              )
            ],
          ),
        )*/
        )
      ],
    )
    );
  }
}