import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController controller =TextEditingController();
  int? Firstnumber;
  int? Secondnumber;
  String? TextDispaly = "";
  String? Operation;
  String? Result = "";

  void buttononclick(String buttonText) {
    setState(() {
      int cursorPosition = controller.selection.baseOffset;
      String currentText = controller.text;

      if (buttonText == "C") {
        controller.clear();
        Firstnumber = null;
        Secondnumber = null;
        Result = "";
        Operation = null;
      } else if (buttonText == "⌫") {
        if (cursorPosition > 0) {
          controller.text = currentText.substring(0, cursorPosition - 1) + currentText.substring(cursorPosition);
          cursorPosition--;
        }
      } else if (buttonText == "+" ||
                 buttonText == "-" ||
                 buttonText == "*" ||
                 buttonText == "/") {
        if (currentText.isNotEmpty && Operation == null) {
          Firstnumber = int.tryParse(currentText) ?? 0;
          Operation = buttonText;
          controller.text = currentText.substring(0, cursorPosition) + buttonText + currentText.substring(cursorPosition);
          cursorPosition++;
        }
      } else if (buttonText == "=") {
        if (Operation != null && Firstnumber != null) {
          Secondnumber = int.tryParse(currentText.replaceFirst(Firstnumber!.toString() + Operation!, "")) ?? 0;

          if (Operation == "+") {
            Result = (Firstnumber! + Secondnumber!).toString();
          } else if (Operation == "-") {
            Result = (Firstnumber! - Secondnumber!).toString();
          } else if (Operation == "*") {
            Result = (Firstnumber! * Secondnumber!).toString();
          } else if (Operation == "/") {
            Result = (Firstnumber! / Secondnumber!).toString();
          }

          controller.text = Result!;
          Operation = null;
          cursorPosition = Result!.length;
        }
      } else {
        controller.text = currentText.substring(0, cursorPosition) + buttonText + currentText.substring(cursorPosition);
        cursorPosition++;
      }

      controller.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text("Calculator", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white
          ),),
        ),
      ),
      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.black26,
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  readOnly: false,
                  showCursor: true,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      buttononclick("⌫");
                    },
                    onLongPress: (){
                      setState(() {
                        TextDispaly = "";
                        controller.text = "";
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("⌫", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                  height: 420,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,left: 10),
                              child: GestureDetector(
                                       onTap: () {
                                       buttononclick("C");
                               },
                                child: Container(
                                  height: 70,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("C",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),)),
                                ),
                              ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: () {
                                buttononclick("()");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("()",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: () {
                                buttononclick("%");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("%",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                                  onTap:  () {
                                    buttononclick('/');
                                  },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("/",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick("7");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("7",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('8');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("8",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('9');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("9",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('*');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("*",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('4');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("4",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('5');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("5",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('6');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("6",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('-');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("-",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('1');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("1",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('2');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("2",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('3');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("3",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick('+');
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("+",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick("+/-");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("+/-",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick("0");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("0",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick(".");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text(".",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10),
                            child: GestureDetector(
                              onTap: (){
                                buttononclick("=");
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("=",style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600
                                ),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            )
          ]
      ),
    );
  }
}
   