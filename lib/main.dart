import 'package:darts/pages/game_page.dart';
import 'package:darts/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        GamePage.id: (context) => GamePage(),
      },
    );
  }
}
