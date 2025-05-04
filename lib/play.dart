import 'package:flutter/material.dart';

import 'Question/Computer.dart';
import 'Question/EnglishQuestion.dart';
import 'Question/Gkquestion.dart';
import 'Question/MathQuestion.dart';
import 'Question/Reasoning.dart';
import 'Question/Science.dart';
import 'appconfig/Animation.dart';

class LetPlay extends StatefulWidget {
  @override
  State<LetPlay> createState() => _LetPlayState();
}

class _LetPlayState extends State<LetPlay> {
  String? selectedCategory;

  void changeBorderColor(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text("Let's play!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("3 days strike!",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 4),
                    Text("+30 daily points",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.6,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),

              // Row 1
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => changeBorderColor("English"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "English" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("English",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/english.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => changeBorderColor("Mathematics"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "Mathematics" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mathematics",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/math.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Row 2
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => changeBorderColor("Reasoning"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "Reasoning" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Reasoning",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/Reasoning.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => changeBorderColor("General Knowledge"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "General Knowledge" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("General Knowledge",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/gk.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Row 3
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => changeBorderColor("General Science"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "General Science" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("General Science",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/science.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => changeBorderColor("General Computer"),
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedCategory == "General Computer" ? Colors.blue : Colors.black26,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("General Computer",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 5),
                            Image.asset('assets/image/computer.png', height: 60, width: 60),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              ElevatedButton(
                onPressed: selectedCategory != null
                    ? () {
                  if (selectedCategory == "English") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: English()),
                    );
                  } else if (selectedCategory == "General Knowledge") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: Gkquestion()),
                    );
                  } else if (selectedCategory == "Mathematics") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: Mathquestion()),
                    );
                  } else if (selectedCategory == "Reasoning") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: Reasoning()),
                    );
                  } else if (selectedCategory == "General Science") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: Science()),
                    );
                  } else if (selectedCategory == "General Computer") {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: Computer()),
                    );
                  }
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 125, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Start playing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
