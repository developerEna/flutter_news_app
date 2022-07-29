import 'package:flutter/material.dart';
import 'package:profile_ui/pages/home.dart';
import 'package:profile_ui/pages/specific_new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      routes: {
        "/": ((context) => Home()),


      },
    );
  }
}

