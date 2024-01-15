import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/screens/home/homescreen.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome()async{
    await Future.delayed(Duration(seconds: 3),(){});
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}