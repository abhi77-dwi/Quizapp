import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appconfig/mq.dart';
import '../congratepage.dart';

class Reasoning extends StatefulWidget {
  @override
  ReasoningState createState() => ReasoningState();
}

class ReasoningState extends State<Reasoning> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "If A is B's father and C is A's brother, how is C related to B?",
      "options": ["Uncle", "Grandfather", "Cousin", "Brother"],
      "answer": "Uncle"
    },
    {
      "question": "John is the son of Mark. Mark is the brother of David. How is David related to John?",
      "options": ["Father", "Uncle", "Grandfather", "Brother"],
      "answer": "Uncle"
    },
    {
      "question": "Sarah is the mother of Tom. Tom is the brother of Lisa. How is Lisa related to Sarah?",
      "options": ["Daughter", "Sister", "Aunt", "Cousin"],
      "answer": "Daughter"
    },
    {
      "question": "If X is the father of Y, and Y is the father of Z, how is X related to Z?",
      "options": ["Father", "Grandfather", "Uncle", "Brother"],
      "answer": "Grandfather"
    },
    {
      "question": "Peter is the father of Mary. Mary is the mother of Sam. How is Peter related to Sam?",
      "options": ["Father", "Uncle", "Grandfather", "Brother"],
      "answer": "Grandfather"
    },
    {
      "question": "If A is married to B, and B is the sister of C, how is C related to A?",
      "options": ["Brother-in-law", "Father-in-law", "Uncle", "Cousin"],
      "answer": "Brother-in-law"
    },
    {
      "question": "Lisa is the daughter of Paul. Paul is the son of Richard. How is Lisa related to Richard?",
      "options": ["Mother", "Granddaughter", "Aunt", "Niece"],
      "answer": "Granddaughter"
    },
    {
      "question": "Tom is the brother of Jerry. Jerry is the father of Sam. How is Tom related to Sam?",
      "options": ["Uncle", "Father", "Cousin", "Brother"],
      "answer": "Uncle"
    },
    {
      "question": "Adam is the father of Ben. Ben is the father of Charlie. How is Adam related to Charlie?",
      "options": ["Uncle", "Brother", "Grandfather", "Cousin"],
      "answer": "Grandfather"
    },
    {
      "question": "Emma is the sister of Jake. Jake is the father of Leo. How is Emma related to Leo?",
      "options": ["Aunt", "Mother", "Grandmother", "Sister"],
      "answer": "Aunt"
    },
    {
      "question": "Kevin is the brother of Lucy. Lucy is the daughter of Robert. How is Kevin related to Robert?",
      "options": ["Son", "Father", "Uncle", "Grandfather"],
      "answer": "Son"
    },
    {
      "question": "Sophia is the mother of John. John is the father of Mia. How is Sophia related to Mia?",
      "options": ["Aunt", "Grandmother", "Sister", "Mother"],
      "answer": "Grandmother"
    },
    {
      "question": "Oliver is the husband of Emma. Emma is the daughter of Henry. How is Henry related to Oliver?",
      "options": ["Father-in-law", "Uncle", "Grandfather", "Brother"],
      "answer": "Father-in-law"
    },
    {
      "question": "Rachel is the wife of Tom. Tom is the father of Steve. How is Rachel related to Steve?",
      "options": ["Mother", "Aunt", "Grandmother", "Sister"],
      "answer": "Mother"
    },
    {
      "question": "Jacob is the father of Ryan. Ryan is the father of Noah. How is Jacob related to Noah?",
      "options": ["Uncle", "Grandfather", "Cousin", "Brother"],
      "answer": "Grandfather"
    }
  ];


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
