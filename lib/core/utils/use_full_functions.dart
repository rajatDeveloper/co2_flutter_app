import 'package:flutter/material.dart';

double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

//do not use this one if app is for web also
double getFontSize(double size, double screenWidth) {
  return size * screenWidth / 414;
}
