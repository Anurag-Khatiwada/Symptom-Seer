import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_seer_final/constants.dart';

import 'allpage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  List _all = [];

  void initState() {
    _getThingsOnStartup().then((value){});
    super.initState();
  }
   Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 1));
    readJson();
  }
  Future<void> readJson() async{
    final String response = await rootBundle.loadString("assets/commondata.json");
    final data = await json.decode(response);
    setState((){
      _all=data["all"];
    });
    print("All Async Done");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: kBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
            children: [
              buildHeadItems(context),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Diseases Data"),
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllPage(all: _all)));
                }
                )
              ],
            ),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}
Widget buildHeadItems(BuildContext context)=>Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
);
Widget buildMenuItems(BuildContext context)=>Container();
