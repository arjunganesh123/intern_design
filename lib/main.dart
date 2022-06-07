import 'package:flutter/material.dart';
import 'package:intern_design/homepage.dart';
import 'package:intern_design/otpgeneratepage.dart';
import 'package:intern_design/userauthpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const UserAuthPage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        UserAuthPage.id:(context)=>const UserAuthPage(),
      },
    );
  }
}
