
import 'package:flutter/material.dart';

class Mq {
  static late double h;
  static late double w;

  static void init(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
  }
}
