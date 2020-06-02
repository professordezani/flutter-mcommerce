import 'package:flutter/material.dart';
import 'package:mcommerce/pages/catalogo.dart';
import 'package:mcommerce/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'M-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFFE5E5E5),
        fontFamily: 'Metropolis'
      ),
      home: SignupPage()
    );
  }
}