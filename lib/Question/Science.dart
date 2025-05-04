import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appconfig/mq.dart';
import '../congratepage.dart';

class Science extends StatefulWidget {
  @override
  ScienceState createState() => ScienceState();
}
class ScienceState extends State<Science> {

  final List<Map<String, dynamic>> questions = [
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
      "question": "What is the largest animal on Earth?",
      "options": ["Elephant", "Blue Whale", "Shark", "Giraffe"],
      "answer": "Blue Whale"
    },
    {
      "question": "Who invented the light bulb?",
      "options": ["Thomas Edison", "Alexander Bell", "Nikola Tesla", "Galileo"],
      "answer": "Thomas Edison"
    },
    {
      "question": "What is the chemical symbol for water?",
      "options": ["O2", "H2O", "CO2", "HO"],
      "answer": "H2O"
    },
    {
      "question": "What is the powerhouse of the cell?",
      "options": ["Nucleus", "Ribosome", "Mitochondria", "Golgi apparatus"],
      "answer": "Mitochondria"
    },
    {
      "question": "What is the speed of light?",
      "options": ["300,000 km/s", "150,000 km/s", "450,000 km/s", "500,000 km/s"],
      "answer": "300,000 km/s"
    },
    {
      "question": "What is the hardest natural substance on Earth?",
      "options": ["Gold", "Iron", "Diamond", "Quartz"],
      "answer": "Diamond"
    },
    {
      "question": "Which part of the human body controls all functions?",
      "options": ["Heart", "Brain", "Lungs", "Liver"],
      "answer": "Brain"
    },
    {
      "question": "What is the boiling point of water at sea level?",
      "options": ["90°C", "100°C", "110°C", "120°C"],
      "answer": "100°C"
    },
    {
      "question": "Which gas do humans exhale?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "answer": "Carbon Dioxide"
    },
    {
      "question": "What force pulls objects toward the center of the Earth?",
      "options": ["Magnetism", "Friction", "Gravity", "Inertia"],
      "answer": "Gravity"
    },
    {
      "question": "What is Earth's primary source of energy?",
      "options": ["Wind", "Water", "Sun", "Coal"],
      "answer": "Sun"
    },
    {
      "question": "Which element is the most abundant in the Earth's atmosphere?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "answer": "Nitrogen"
    },
    {
      "question": "Which part of the plant conducts photosynthesis?",
      "options": ["Roots", "Stem", "Leaves", "Flowers"],
      "answer": "Leaves"
    },
    {
      "question": "Which blood cells help fight infections?",
      "options": ["Red blood cells", "Platelets", "White blood cells", "Plasma"],
      "answer": "White blood cells"
    },
    {
      "question": "What is the unit of electric current?",
      "options": ["Watt", "Ampere", "Volt", "Ohm"],
      "answer": "Ampere"
    },
    {
      "question": "What is the largest organ in the human body?",
      "options": ["Heart", "Liver", "Brain", "Skin"],
      "answer": "Skin"
    },
    {
      "question": "Which gas makes up most of the Earth's atmosphere?",
      "options": ["Oxygen", "Nitrogen", "Carbon Dioxide", "Argon"],
      "answer": "Nitrogen"
    },
    {
      "question": "Which metal is liquid at room temperature?",
      "options": ["Iron", "Mercury", "Lead", "Aluminum"],
      "answer": "Mercury"
    },
    {
      "question": "What is the main function of red blood cells?",
      "options": ["Fight infections", "Carry oxygen", "Digest food", "Control body temperature"],
      "answer": "Carry oxygen"
    },
    {
      "question": "Which planet is closest to the Sun?",
      "options": ["Venus", "Mars", "Mercury", "Earth"],
      "answer": "Mercury"
    },
    {
      "question": "What is the study of living organisms called?",
      "options": ["Physics", "Chemistry", "Biology", "Geology"],
      "answer": "Biology"
    },
    {
      "question": "Which organ helps to filter and clean the blood?",
      "options": ["Liver", "Heart", "Kidney", "Lungs"],
      "answer": "Kidney"
    },
    {
      "question": "Which planet has the largest rings in the solar system?",
      "options": ["Jupiter", "Saturn", "Uranus", "Neptune"],
      "answer": "Saturn"
    },
    {
      "question": "What type of energy is stored in food?",
      "options": ["Kinetic energy", "Chemical energy", "Thermal energy", "Nuclear energy"],
      "answer": "Chemical energy"
    },
    {
      "question": "Which part of the body produces insulin?",
      "options": ["Liver", "Pancreas", "Heart", "Kidney"],
      "answer": "Pancreas"
    },
    {
      "question": "What is the smallest unit of life?",
      "options": ["Atom", "Molecule", "Cell", "Organ"],
      "answer": "Cell"
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
