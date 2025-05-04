import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appconfig/mq.dart';
import '../congratepage.dart';

class Gkquestion extends StatefulWidget {
  @override
  GkquestionState createState() => GkquestionState();
}
class GkquestionState extends State<Gkquestion> {

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Madrid", "Paris", "Rome", "Berlin"],
      "answer": "Paris"
    },
    {
      "question": "Which is the largest ocean in the world?",
      "options": ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"],
      "answer": "Pacific Ocean"
    },
    {
      "question": "Mount Everest is located in which country?",
      "options": ["India", "Nepal", "China", "Pakistan"],
      "answer": "Nepal"
    },
    {
      "question": "Which river is the longest in the world?",
      "options": ["Amazon", "Nile", "Yangtze", "Mississippi"],
      "answer": "Nile"
    },
    {
      "question": "The Sahara Desert is primarily located on which continent?",
      "options": ["Asia", "Africa", "Australia", "South America"],
      "answer": "Africa"
    },
    {
      "question": "Which is the smallest country in the world?",
      "options": ["Monaco", "San Marino", "Vatican City", "Liechtenstein"],
      "answer": "Vatican City"
    },
    {
      "question": "Who discovered America?",
      "options": ["Vasco da Gama", "Christopher Columbus", "Ferdinand Magellan", "Marco Polo"],
      "answer": "Christopher Columbus"
    },
    {
      "question": "The first World War started in which year?",
      "options": ["1912", "1914", "1918", "1923"],
      "answer": "1914"
    },
    {
      "question": "Who was the first President of the United States?",
      "options": ["Abraham Lincoln", "George Washington", "Thomas Jefferson", "John Adams"],
      "answer": "George Washington"
    },
    {
      "question": "The Taj Mahal was built by which Mughal emperor?",
      "options": ["Akbar", "Babur", "Shah Jahan", "Aurangzeb"],
      "answer": "Shah Jahan"
    },
    {
      "question": "In which year did India gain independence?",
      "options": ["1945", "1946", "1947", "1948"],
      "answer": "1947"
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "options": ["Mercury", "Venus", "Mars", "Jupiter"],
      "answer": "Mars"
    },
    {
      "question": "What gas do plants absorb from the atmosphere?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "answer": "Carbon Dioxide"
    },
    {
      "question": "How many bones are there in the human body?",
      "options": ["200", "206", "212", "218"],
      "answer": "206"
    },
    {
      "question": "Which vitamin is produced when our skin is exposed to sunlight?",
      "options": ["Vitamin A", "Vitamin B", "Vitamin C", "Vitamin D"],
      "answer": "Vitamin D"
    },
    {
      "question": "Which sport is associated with Wimbledon?",
      "options": ["Football", "Tennis", "Cricket", "Golf"],
      "answer": "Tennis"
    },
    {
      "question": "How many players are there in a football (soccer) team?",
      "options": ["9", "10", "11", "12"],
      "answer": "11"
    },
    {
      "question": "Which country won the FIFA World Cup in 2018?",
      "options": ["Germany", "Brazil", "France", "Argentina"],
      "answer": "France"
    },
    {
      "question": "Who is known as the 'King of Pop'?",
      "options": ["Elvis Presley", "Michael Jackson", "Justin Bieber", "The Beatles"],
      "answer": "Michael Jackson"
    },
    {
      "question": "What is the currency of Japan?",
      "options": ["Yen", "Won", "Rupee", "Dollar"],
      "answer": "Yen"
    },
    {
      "question": "Which company developed the iPhone?",
      "options": ["Microsoft", "Samsung", "Apple", "Google"],
      "answer": "Apple"
    },
    {
      "question": "What is the largest animal on Earth?",
      "options": ["Elephant", "Blue Whale", "Shark", "Giraffe"],
      "answer": "Blue Whale"
    },
    {
      "question": "Which is the tallest building in the world?",
      "options": ["Burj Khalifa", "Shanghai Tower", "Empire State Building", "One World Trade Center"],
      "answer": "Burj Khalifa"
    },
    {
      "question": "What does 'WWW' stand for in a website address?",
      "options": ["World Wide Web", "Web World Wide", "Wide Web World", "Web Wide World"],
      "answer": "World Wide Web"
    },
    {
      "question": "Who invented the light bulb?",
      "options": ["Thomas Edison", "Alexander Bell", "Nikola Tesla", "Galileo"],
      "answer": "Thomas Edison"
    },
    {
      "question": "Which country is famous for pizza?",
      "options": ["France", "Italy", "Spain", "Greece"],
      "answer": "Italy"
    },
    {
      "question": "What is the national flower of India?",
      "options": ["Rose", "Lotus", "Sunflower", "Jasmine"],
      "answer": "Lotus"
    },
    {
      "question": "What does the 'E' stand for in 'E-mail'?",
      "options": ["Electronic", "Express", "External", "Essential"],
      "answer": "Electronic"
    },
    {
      "question": "How many continents are there on Earth?",
      "options": ["5", "6", "7", "8"],
      "answer": "7"
    },
    {
      "question": "Into how many distinctive types of territories was the Harshvardhan Dynasty divided?",
      "options": ["Four", "Three", "Two", "Five"],
      "answer": "Two"
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
