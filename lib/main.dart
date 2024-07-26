// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecoguard/pages/login.dart';
import 'package:ecoguard/pages/home.dart';
import 'package:ecoguard/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecoguard App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => LoginPage(),
        '/landingpage': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
