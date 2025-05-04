import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appconfig/mq.dart';
import '../congratepage.dart';

class Mathquestion extends StatefulWidget {
  @override
  MathquestionState createState() => MathquestionState();
}
class MathquestionState extends State<Mathquestion> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the value of 25 × 4?",
      "options": ["50", "75", "100", "125"],
      "answer": "100"
    },
    {
      "question": "If a shopkeeper sells an item for 120 and makes a profit of 20, what was the cost price?",
      "options": ["80", "90", "100", "110"],
      "answer": "100"
    },
    {
      "question": "What is 15% of 200?",
      "options": ["20", "25", "30", "35"],
      "answer": "30"
    },
    {
      "question": "A train travels at 60 km/h. How far does it travel in 2.5 hours?",
      "options": ["100 km", "120 km", "150 km", "180 km"],
      "answer": "150 km"
    },
    {
      "question": "What is the square of 16?",
      "options": ["128", "196", "256", "324"],
      "answer": "256"
    },
    {
      "question": "What is the cube root of 27?",
      "options": ["2", "3", "4", "5"],
      "answer": "3"
    },
    {
      "question": "If 5x = 20, what is the value of x?",
      "options": ["2", "3", "4", "5"],
      "answer": "4"
    },
    {
      "question": "The average of 10, 20, and 30 is:",
      "options": ["15", "20", "25", "30"],
      "answer": "20"
    },
    {
      "question": "What is the value of 45 ÷ 5?",
      "options": ["5", "7", "9", "11"],
      "answer": "9"
    },
    {
      "question": "What is the LCM of 12 and 15?",
      "options": ["30", "45", "60", "75"],
      "answer": "60"
    },
    {
      "question": "The HCF of 36 and 48 is:",
      "options": ["6", "12", "18", "24"],
      "answer": "12"
    },
    {
      "question": "If a number is divided by 4, the remainder is 2. What will be the remainder when it is divided by 2?",
      "options": ["0", "1", "2", "3"],
      "answer": "0"
    },
    {
      "question": "A shopkeeper gives a discount of 10% on a 500 item. What is the final price?",
      "options": ["450", "460", "470", "480"],
      "answer": "450"
    },
    {
      "question": "A train covers 300 km in 5 hours. What is its speed?",
      "options": ["40 km/h", "50 km/h", "60 km/h", "70 km/h"],
      "answer": "60 km/h"
    },
    {
      "question": "What is the sum of the first 10 natural numbers?",
      "options": ["45", "50", "55", "60"],
      "answer": "55"
    },
    {
      "question": "A person spends 60% of his income. If he earns 5000, how much does he save?",
      "options": ["1000", "1500", "2000", "2500"],
      "answer": "2000"
    },
    {
      "question": "If 3a = 18, what is the value of a?",
      "options": ["3", "4", "5", "6"],
      "answer": "6"
    },
    {
      "question": "A father is twice as old as his son. If the son is 25 years old, how old is the father?",
      "options": ["45", "50", "55", "60"],
      "answer": "50"
    },
    {
      "question": "What is the area of a rectangle with length 8m and width 6m?",
      "options": ["36 m²", "42 m²", "48 m²", "54 m²"],
      "answer": "48 m²"
    },
    {
      "question": "What is the perimeter of a square with a side length of 5 cm?",
      "options": ["10 cm", "15 cm", "20 cm", "25 cm"],
      "answer": "20 cm"
    },
    {
      "question": "A car travels 90 km in 3 hours. What is its speed?",
      "options": ["25 km/h", "30 km/h", "35 km/h", "40 km/h"],
      "answer": "30 km/h"
    },
    {
      "question": "What is the value of (8 + 4) × 3?",
      "options": ["24", "30", "36", "40"],
      "answer": "36"
    },
    {
      "question": "What is the value of 81 ÷ 9?",
      "options": ["5", "6", "7", "9"],
      "answer": "9"
    },
    {
      "question": "If 4 pencils cost 8, what is the cost of 10 pencils?",
      "options": ["16", "18", "20", "22"],
      "answer": "20"
    },
    {
      "question": "What is the remainder when 23 is divided by 4?",
      "options": ["0", "1", "2", "3"],
      "answer": "3"
    },
    {
      "question": "The sum of two consecutive even numbers is 30. What are the numbers?",
      "options": ["14 and 16", "12 and 14", "10 and 12", "8 and 10"],
      "answer": "14 and 16"
    },
    {
      "question": "What is the probability of getting a head when flipping a fair coin?",
      "options": ["1/4", "1/3", "1/2", "1"],
      "answer": "1/2"
    },
    {
      "question": "A triangle has sides of 3 cm, 4 cm, and 5 cm. What type of triangle is this?",
      "options": ["Equilateral", "Isosceles", "Right-angled", "Scalene"],
      "answer": "Right-angled"
    },
    {
      "question": "A person buys an item for 200 and sells it for 250. What is the profit percentage?",
      "options": ["10%", "20%", "25%", "30%"],
      "answer": "25%"
    },
    {
      "question": "What is the square root of 144?",
      "options": ["10", "11", "12", "13"],
      "answer": "12"
    },
    {
      "question": "What is the sum of the angles in a triangle?",
      "options": ["90°", "120°", "180°", "360°"],
      "answer": "180°"
    },
    {
      "question": "If a number is increased by 25%, what is its new value if the original number is 200?",
      "options": ["225", "250", "275", "300"],
      "answer": "250"
    },
    {
      "question": "A train travels at 90 km/h. How long will it take to cover 270 km?",
      "options": ["2 hours", "3 hours", "4 hours", "5 hours"],
      "answer": "3 hours"
    },
    {
      "question": "If x + 5 = 12, what is the value of x?",
      "options": ["5", "6", "7", "8"],
      "answer": "7"
    },
    {
      "question": "If 6 workers can build a wall in 10 days, how many workers are needed to build it in 5 days?",
      "options": ["8", "10", "12", "15"],
      "answer": "12"
    }
  ]
  ;
  int currentQuestionIndex = 0;
  int score = 0;
  int _timeLeft = 1800;
  Timer? _timer;
  Map<int, String?> selectedOptions = {};


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        navigateToCongratsPage();
      }
    });
  }

  void answer(String selectedAnswer) {
    setState(() {
      selectedOptions[currentQuestionIndex] = selectedAnswer;
    });
  }

  void nextQuestion() {
    if (selectedOptions[currentQuestionIndex] == null) return;

    setState(() {
      if (selectedOptions[currentQuestionIndex] == questions[currentQuestionIndex]['answer']) {
        score++;
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        navigateToCongratsPage();
      }
    });
  }
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void navigateToCongratsPage() {
    _timer?.cancel();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CongratsPage(score: score, total: questions.length),
      ),
    );
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _timeLeft = 1800;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  double getProgress() {
    return (_timeLeft / 1800);
  }
  @override
  Widget build(BuildContext context) {
    Mq.init(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: EdgeInsets.all(Mq.w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: getProgress(),
                      strokeWidth: 10,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Text(
                    formatTime(_timeLeft),
                    style: TextStyle(fontSize: Mq.h * 0.04, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: Mq.h * 0.03),

            // Question Text
            Center(
              child: Text(
                questions[currentQuestionIndex]['question'],
                style: TextStyle(fontSize: Mq.h * 0.025, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Mq.h * 0.03),

            // Options
            Column(
              children: questions[currentQuestionIndex]['options'].map<Widget>((option) {
                bool isSelected = selectedOptions[currentQuestionIndex] == option;
                bool isCorrect = option == questions[currentQuestionIndex]['answer'];
                Color borderColor = isSelected
                    ? (isCorrect ? Colors.green : Colors.red)
                    : Colors.transparent;
                return Container(
                  width: double.infinity,
                  height: Mq.h * 0.07,
                  margin: EdgeInsets.symmetric(vertical: Mq.h * 0.015),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor, width: 4),
                  ),
                  child: TextButton(
                    onPressed: () => answer(option),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(fontSize: Mq.h * 0.022),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0
                        ? () {
                      setState(() {
                        currentQuestionIndex--;
                      });
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Previous',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),

                  SizedBox(width: 170),
                  ElevatedButton(
                    onPressed: selectedOptions != null ? nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
