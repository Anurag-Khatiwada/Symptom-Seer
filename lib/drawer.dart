import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/homescreen.dart';
import 'package:s_seer_final/settings.dart';

import 'allpage.dart';
import 'helppage.dart';

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
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                runSpacing: 16,
              children: [
                buildHeadItems(context),
                ListTile(tileColor: kPrimaryColor,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  leading: const Icon(Icons.home_filled),
                  title: const Text("Home"),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }
                  ),
                  ListTile(tileColor: kPrimaryColor,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    leading: const Icon(Icons.menu_book_sharp),
                    title: const Text("Diseases Data"),
                    onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AllPage(all: _all)));
                    }
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black),
            Container(
              padding: EdgeInsets.all(20),
              child: ListTile(tileColor: kPrimaryColor,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
                      }
                    ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20,0,20,10),
              child: ListTile(tileColor: kPrimaryColor,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      leading: const Icon(Icons.help),
                      title: const Text("Help Center"),
                      onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));
                      }
                    ),
            ),
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
