import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firstScreen.dart';
import 'Question/Gkquestion.dart';

class CongratsPage extends StatelessWidget {
  final int score;
  final int total;

  CongratsPage({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.asset(
                'assets/image/cong.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.amber, Colors.orangeAccent],
              ).createShader(bounds),
              child: Text(
                "Congratulations🎉",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.amber, Colors.orangeAccent],
              ).createShader(bounds),
              child: Text(
                "You did a great job in the test🎉",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.amber, Colors.orange, Colors.yellow],
              ).createShader(bounds),
              child: Text(
                '🏆 Your score: $score / $total 🎯',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 100.0),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Firstscreen()),
                      (route) => false,
                );
              },
              child: Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
