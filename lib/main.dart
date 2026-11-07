import 'package:flutter/material.dart';

import 'xylophone_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Xylophone',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight(700),
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.teal[700],
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              // border: Border.all(width: 10, color: Colors.white),
            ),
            child: XylophoneBody(),
          ),
        ),
      ),
    );
  }
}
