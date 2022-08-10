import 'package:flutter/material.dart';

class AppLayout {
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static double getHeigth(BuildContext context, {double value = 1}) => MediaQuery.of(context).size.height * value;
  static double getWidth(BuildContext context, {double value = 1}) => MediaQuery.of(context).size.width * value;
}