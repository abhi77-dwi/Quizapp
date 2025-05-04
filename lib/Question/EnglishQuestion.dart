import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../congratepage.dart';
import '../appconfig/mq.dart';

class English extends StatefulWidget {
  @override
  EnglishState createState() => EnglishState();
}

class EnglishState extends State<English> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Choose the correct word: She ___ to the store yesterday.",
      "options": ["go", "goes", "went", "going"],
      "answer": "went"
    },
    {
      "question": "Identify the noun in the sentence: 'The cat is sleeping on the couch.'",
      "options": ["sleeping", "on", "cat", "is"],
      "answer": "cat"
    },
    {
      "question": "Which of the following is a synonym for 'happy'?",
      "options": ["Sad", "Joyful", "Angry", "Boring"],
      "answer": "Joyful"
    },
    {
      "question": "What is the plural form of 'child'?",
      "options": ["Childs", "Children", "Childes", "Childrens"],
      "answer": "Children"
    },
    {
      "question": "Which sentence is grammatically correct?",
      "options": [
        "She don't like apples.",
        "He goes to school every day.",
        "They was playing outside.",
        "I can speaks English."
      ],
      "answer": "He goes to school every day."
    },
    {
      "question": "What is the past tense of 'run'?",
      "options": ["Run", "Running", "Ran", "Runs"],
      "answer": "Ran"
    },
    {
      "question": "Which word is an adjective in the sentence: 'The beautiful flower bloomed in the garden.'?",
      "options": ["flower", "bloomed", "garden", "beautiful"],
      "answer": "beautiful"
    },
    {
      "question": "Which of the following is a type of punctuation?",
      "options": ["Verb", "Adjective", "Comma", "Noun"],
      "answer": "Comma"
    },
    {
      "question": "Which word means the opposite of 'dark'?",
      "options": ["Black", "Light", "Heavy", "Night"],
      "answer": "Light"
    },
    {
      "question": "Which sentence uses the correct form of 'their', 'there', or 'they're'?",
      "options": [
        "Their going to the park.",
        "They're bringing their dog.",
        "There dog is very cute.",
        "We are going to their."
      ],
      "answer": "They're bringing their dog."
    },
    {
      "question": "Which word is a pronoun?",
      "options": ["Table", "She", "Run", "Big"],
      "answer": "She"
    },
    {
      "question": "What is the superlative form of 'fast'?",
      "options": ["Fast", "Faster", "Fastest", "More fast"],
      "answer": "Fastest"
    },
    {
      "question": "Choose the correct sentence:",
      "options": [
        "The books is on the table.",
        "She has a red car.",
        "Him is very happy today.",
        "Me likes to play football."
      ],
      "answer": "She has a red car."
    },
    {
      "question": "Which of these words is a verb?",
      "options": ["Happy", "Quickly", "Jump", "Blue"],
      "answer": "Jump"
    },
    {
      "question": "Which of the following words is spelled correctly?",
      "options": ["Recieve", "Definately", "Tomorrow", "Accomodate"],
      "answer": "Tomorrow"
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
