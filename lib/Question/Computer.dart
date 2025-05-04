import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appconfig/mq.dart';
import '../congratepage.dart';

class Computer extends StatefulWidget {
  @override
  ComputerState createState() => ComputerState();
}
class ComputerState extends State<Computer> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What does CPU stand for?",
      "options": ["Central Processing Unit", "Computer Personal Unit", "Central Process Utility", "Control Processing Unit"],
      "answer": "Central Processing Unit"
    },
    {
      "question": "Which of the following is an input device?",
      "options": ["Monitor", "Keyboard", "Speaker", "Printer"],
      "answer": "Keyboard"
    },
    {
      "question": "Which company developed the Windows operating system?",
      "options": ["Apple", "Microsoft", "Google", "IBM"],
      "answer": "Microsoft"
    },
    {
      "question": "What is the brain of the computer?",
      "options": ["RAM", "Hard Drive", "CPU", "Motherboard"],
      "answer": "CPU"
    },
    {
      "question": "What is the full form of RAM?",
      "options": ["Random Access Memory", "Read Access Memory", "Run Access Memory", "Rapid Access Memory"],
      "answer": "Random Access Memory"
    },
    {
      "question": "What does HTML stand for?",
      "options": ["Hyper Text Markup Language", "High Text Machine Language", "Hyperlink and Text Markup Language", "Home Tool Markup Language"],
      "answer": "Hyper Text Markup Language"
    },
    {
      "question": "Which programming language is known as the mother of all languages?",
      "options": ["C", "Java", "Python", "Fortran"],
      "answer": "C"
    },
    {
      "question": "Which of the following is an operating system?",
      "options": ["Windows", "Google", "Firefox", "Microsoft Office"],
      "answer": "Windows"
    },
    {
      "question": "Which of the following is NOT a web browser?",
      "options": ["Chrome", "Firefox", "Safari", "Linux"],
      "answer": "Linux"
    },
    {
      "question": "What does URL stand for?",
      "options": ["Uniform Resource Locator", "Universal Reference Link", "Uniform Reference Locator", "Universal Resource Link"],
      "answer": "Uniform Resource Locator"
    },
    {
      "question": "What is the main function of an operating system?",
      "options": ["Manage hardware and software", "Play games", "Create graphics", "Edit text documents"],
      "answer": "Manage hardware and software"
    },
    {
      "question": "Which device is used to store data permanently?",
      "options": ["RAM", "ROM", "Hard Drive", "Cache"],
      "answer": "Hard Drive"
    },
    {
      "question": "What does HTTP stand for?",
      "options": ["HyperText Transfer Protocol", "Hyperlink Text Transfer Protocol", "High Text Transmission Protocol", "Hyper Transfer Text Protocol"],
      "answer": "HyperText Transfer Protocol"
    },
    {
      "question": "Which of the following is NOT a programming language?",
      "options": ["Python", "JavaScript", "HTML", "Photoshop"],
      "answer": "Photoshop"
    },
    {
      "question": "What does BIOS stand for?",
      "options": ["Basic Input Output System", "Binary Input Output System", "Basic Integrated Operating System", "Built-in Operating System"],
      "answer": "Basic Input Output System"
    },
    {
      "question": "What is the name of the first computer?",
      "options": ["ENIAC", "UNIVAC", "IBM 5100", "Apple I"],
      "answer": "ENIAC"
    },
    {
      "question": "Which key combination is used to copy text?",
      "options": ["Ctrl + C", "Ctrl + X", "Ctrl + V", "Ctrl + P"],
      "answer": "Ctrl + C"
    },
    {
      "question": "What does SSD stand for?",
      "options": ["Solid State Drive", "Soft System Device", "Secure Storage Disk", "Software System Drive"],
      "answer": "Solid State Drive"
    },
    {
      "question": "What is open-source software?",
      "options": ["Free to use and modify", "Owned by Microsoft", "Requires a license", "Only used in government"],
      "answer": "Free to use and modify"
    },
    {
      "question": "Which company developed the iPhone?",
      "options": ["Microsoft", "Apple", "Google", "Samsung"],
      "answer": "Apple"
    },
    {
      "question": "Which part of the computer connects all its components?",
      "options": ["RAM", "Processor", "Motherboard", "Power Supply"],
      "answer": "Motherboard"
    },
    {
      "question": "What does GUI stand for?",
      "options": ["Graphical User Interface", "General Utility Interface", "Graphical Utility Input", "General User Input"],
      "answer": "Graphical User Interface"
    },
    {
      "question": "Which of these storage devices has the highest capacity?",
      "options": ["Floppy disk", "CD", "DVD", "Blu-ray"],
      "answer": "Blu-ray"
    },
    {
      "question": "What is a computer virus?",
      "options": ["A type of malware", "A hardware issue", "A programming language", "An antivirus software"],
      "answer": "A type of malware"
    },
    {
      "question": "What does IP stand for in networking?",
      "options": ["Internet Protocol", "Internal Processing", "Integrated Program", "Information Protocol"],
      "answer": "Internet Protocol"
    },
    {
      "question": "What is a firewall used for?",
      "options": ["Protecting networks", "Increasing computer speed", "Repairing hard drives", "Managing files"],
      "answer": "Protecting networks"
    },
    {
      "question": "Which of these is an example of an email service?",
      "options": ["Google Drive", "Gmail", "Photoshop", "Microsoft Excel"],
      "answer": "Gmail"
    },
    {
      "question": "Which protocol is used to send emails?",
      "options": ["HTTP", "FTP", "SMTP", "TCP"],
      "answer": "SMTP"
    },
    {
      "question": "Which language is primarily used for web development?",
      "options": ["Python", "Java", "C++", "JavaScript"],
      "answer": "JavaScript"
    },
    {
      "question": "Which key is used to refresh a webpage?",
      "options": ["F1", "F2", "F5", "F12"],
      "answer": "F5"
    },
    {
      "question": "What does VPN stand for?",
      "options": ["Virtual Private Network", "Visual Private Node", "Very Personal Network", "Verified Protected Net"],
      "answer": "Virtual Private Network"
    },
    {
      "question": "Which company created the Linux operating system?",
      "options": ["Microsoft", "Apple", "IBM", "None, it's open-source"],
      "answer": "None, it's open-source"
    },
    {
      "question": "Which device helps in connecting to the internet?",
      "options": ["Monitor", "Router", "Printer", "Speaker"],
      "answer": "Router"
    },
    {
      "question": "What is the default file extension for a Microsoft Word document?",
      "options": [".doc", ".docx", ".xls", ".ppt"],
      "answer": ".docx"
    },
    {
      "question": "Which of these is an example of cloud storage?",
      "options": ["Google Drive", "USB Flash Drive", "CD-ROM", "External Hard Drive"],
      "answer": "Google Drive"
    },
    {
      "question": "What is the most widely used programming language?",
      "options": ["Java", "Python", "C", "JavaScript"],
      "answer": "JavaScript"
    },
    {
      "question": "What does AI stand for?",
      "options": ["Artificial Intelligence", "Automated Input", "Advanced Internet", "Application Interface"],
      "answer": "Artificial Intelligence"
    },
    {
      "question": "Which is an example of an output device?",
      "options": ["Mouse", "Keyboard", "Monitor", "Scanner"],
      "answer": "Monitor"
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
