import 'package:flutter/material.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/homescreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class DisplayScreen extends StatelessWidget {
 
//   DisplayScreen({super.key, required this.data});
//   List data;
  
//   //String jsonString = jsonEncode(data);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));},
//         child: Container(
//           height: 500,width: 300,
//           decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(10)),
          
//           child: Text("$data"),
          
//         ),
//       ),
//     );
//   }
// }

class DisplayScreen extends StatefulWidget {
  DisplayScreen({super.key, required this.data});

  List data;

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  String responseText = ''; // to store the response from the backend

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
        // Update the state with the decoded data
        setState(() {
          if (decodedData is String) {
            responseText = decodedData;
          } else if (decodedData is List) {
            responseText = decodedData.toString();
          }
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
          child: Text(responseText),
        ),
      ),
    );
  }
}
