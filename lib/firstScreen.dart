import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/appconfig/mq.dart';
import 'package:quiz_app/play.dart';
import 'Question/Gkquestion.dart';
import 'appconfig/Animation.dart';
import 'login.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Mq.init(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: EdgeInsets.all(Mq.w * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blue, Colors.cyan],
              ).createShader(bounds),
              child: Text(
                "Quiz",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Mq .h *0.01),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blue, Colors.cyan],
              ).createShader(bounds),
              child: Text(
                "1,000+ quizzes to challenge you and your friends on all topics!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Mq .h *0.05),
            Container(
              width: Mq.w * 0.9,
              height: Mq.h * 0.40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  // BoxShadow(
                  //  // color: Colors.lightBlueAccent,
                  //   blurRadius: ,
                  //   spreadRadius: 1,
                  // ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/image/img.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: Mq .h * 0.1),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: Singup()), // Slide from right to left
                );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                padding: EdgeInsets.symmetric(
                  horizontal: Mq.w * 0.3,
                  vertical: Mq.h * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Start playing',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
