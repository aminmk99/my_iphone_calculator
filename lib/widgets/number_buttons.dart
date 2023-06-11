import 'package:flutter/material.dart';

class NumberButtons extends StatelessWidget {
  NumberButtons({required this.action, required this.text});

  VoidCallback action;
  late Size size;
  String text;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double paddSize = size.height / 55;
    double fontSize = size.height / 20;
    double buttonSize = size.width / 5.9;

    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        onPressed: action,
        backgroundColor: Colors.grey[800],
        child: Center(child: Text(text, style: TextStyle(fontSize: fontSize))),
      ),
    );
  }
}
