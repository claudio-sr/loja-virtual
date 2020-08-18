import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screens.dart';
import 'package:loja_virtual/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}