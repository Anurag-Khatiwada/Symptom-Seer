import 'package:flutter/material.dart';
import 'package:s_seer_final/homescreen.dart';

class DisplayScreen extends StatelessWidget {
  List data=[];
  
  DisplayScreen({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())); },
        child: Container(
          height: 500,width: 300,
          decoration: BoxDecoration(color: Colors.red),
          child: Text("${data}"),
          
        ),
      ),
    );
  }
}