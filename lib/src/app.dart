import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle/src/vehicle/vehicle.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey[200]
      ),
      home: Vehicle(),
    );
  }
}