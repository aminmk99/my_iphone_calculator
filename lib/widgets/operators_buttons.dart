import 'package:flutter/material.dart';

class OperatorsButtons extends StatelessWidget {
  OperatorsButtons(
      {required this.action, required this.text, required this.isPressed});

  VoidCallback action;
  late Size size;
  String text;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double fontSize = size.height / 20;
    double buttonSize = size.width / 5.9;
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        onPressed: action,
        backgroundColor:
            isPressed ? Colors.white : Color.fromRGBO(255, 149, 0, 1.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: isPressed ? Color.fromRGBO(255, 149, 0, 1.0) : Colors.white,
          ),
        ),
      ),
    );
  }
}
