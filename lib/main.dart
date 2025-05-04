import 'package:flutter/material.dart';
import 'package:quiz_app/firstScreen.dart';
import 'package:quiz_app/play.dart';
import 'Calculator.dart';
import 'Question/EnglishQuestion.dart';
import 'Question/Gkquestion.dart';
import 'Question/Reasoning.dart';
import 'SplaceScreen.dart';
import 'congratepage.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstscreen()
    );
  }
}
