import 'package:flutter/material.dart';
import 'package:s_seer_final/dependency_injection.dart';
import 'package:s_seer_final/splash.dart';
import 'constants.dart';
import 'package:get/get.dart';
Future <void> main() async{
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S-Seer',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}