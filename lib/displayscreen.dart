import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/homescreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DisplayScreen extends StatefulWidget {
  DisplayScreen({super.key, required this.data});

  List data;

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  String disname = ''; // to store the response from the backend
  String sev = ''; 
  

  @override
  void initState() {
    super.initState();
    sendAndReceiveData(); // automatically send and receive data when the page opens
  }

  void sendAndReceiveData() async {
    String apiUrl = 'http://10.0.2.2:5000/receive-json';
    String jsonString = jsonEncode(widget.data);

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonString,
      );

      if (response.statusCode == 200) {
        // Decode the response from JSON to a string or list
        var decodedData = jsonDecode(response.body);
        print("succesful");
        print(decodedData.toString());
        // Update the state with the decoded data
        setState(() {
          disname=decodedData['message'];
          sev=decodedData['sev'];

        });
      }
      else{
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending/receiving data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        },
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            color:kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0,50,18,0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text(
              'Symptoms entered:',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.black,decoration: TextDecoration.none),
            ),
                Text(widget.data.toString(),textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12,color: Colors.black,decoration: TextDecoration.none)
                ),
                const SizedBox(height: 20),
                const Text(
              'You may have been suffering from:',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,color: Colors.black,decoration: TextDecoration.none),
            ),
            const SizedBox(height: 20),
            Text(disname,style: const TextStyle(fontSize: 35,color: Colors.black,decoration: TextDecoration.none),
            ),
            Text(sev,textAlign: TextAlign.center,style: const TextStyle(fontSize: 22,color: Colors.black,decoration: TextDecoration.none),
            ),
            const SizedBox(height: 20),
            const Text('Disclaimer: We do not assert absolute accuracy in our predictions and recommend that you seek further examination at the nearest health centers for a comprehensive checkup.',
              style: TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
