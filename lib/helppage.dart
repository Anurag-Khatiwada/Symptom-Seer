import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';
import 'drawer.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
      title: Text("Help Center"),
      backgroundColor: kPrimaryColor,
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              GestureDetector(onTap: () async {
                      final call = Uri.parse('tel: +977 9808392739');
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                 ),
                  child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 70,
                  ),
                ),
              ),
              SizedBox(width: 10,),
                  Container(width: 200,height: 70,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Call Us',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            '10AM - 6PM [ Sun-Sat ]',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              GestureDetector(onTap: () async {
                      final email = Uri(
                        scheme: 'mailto',
                        path: 'sseer@gmail.com',
                        query: 'subject=Hello&body=How to use this app?',
                      );
                      if (await canLaunchUrl(email)) {
                        launchUrl(email);
                      } else {
                        throw 'Could not launch $email';
                      }
                    },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                  ),
                  child: Icon(
                  Icons.mail_lock_sharp,
                  color: Colors.white,
                  size: 70,
                  ),
                ),
              ),
              SizedBox(width: 10,),
                  Container(width: 200,height: 70,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Email Us',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Reach out to us 24/7',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ))
            ],
          ),
        )
      ]
    )
    );
  }
}



