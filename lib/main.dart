import 'package:flutter/material.dart';
import 'package:mcommerce/pages/catalogo.dart';
import 'package:mcommerce/pages/forgot_password.dart';
import 'package:mcommerce/pages/signin.dart';
import 'package:mcommerce/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var routes = {
      '/' : (context) => SignupPage(),
      '/catalogo': (context) => CatalogoPage(),
      '/login': (context) => SigninPage(),
      '/forgotpassword': (context) => ForgotPasswordPage()
    };

    return MaterialApp(
      title: 'M-Commerce',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xFFE5E5E5),
        fontFamily: 'Metropolis'
      ),
      // home: SignupPage()
      routes: routes,
      initialRoute: '/',
    );
  }
}