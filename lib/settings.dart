import 'package:flutter/material.dart';
import 'package:s_seer_final/drawer.dart';
import 'constants.dart';

class SettingPage extends StatefulWidget {

  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
      title: Text("Settings"),
      backgroundColor: kPrimaryColor,
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kPrimaryColor,
                        ),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
        )
      ]
    )
      

    
    );
  }
}