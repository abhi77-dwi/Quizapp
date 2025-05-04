import 'package:flutter/material.dart';
import 'package:quiz_app/play.dart';

import 'appconfig/Animation.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [Colors.blue, Colors.cyan],
                          ).createShader(bounds),
                          child: Text(
                            "Sign Up Now",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Refer Code (Optional)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                 SizedBox(height: 50,),
                 ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     SlideLeftRoute(page: LetPlay()),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 125, vertical: 15),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
              ),
            ),
                  child: Text(
                 'Sign Up',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}