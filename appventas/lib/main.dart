import 'package:appventas/check_login.dart';
import 'package:appventas/pages/home.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'check_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: login(),
      routes: {
        'register': (context) => register(),
        'home':(context) => HomePage(),
        'login':(context) => login(),
      },
    );
  }
}
