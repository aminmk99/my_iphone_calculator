import 'package:flutter/material.dart';

typedef FutureCallback = Future<void> Function();

class DisplayFormatButtons extends StatelessWidget {
  DisplayFormatButtons({
    required this.action,
    required this.text,
  });

  VoidCallback action;
  String text;
  late Size size;

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
        backgroundColor: Color.fromRGBO(160, 160, 160, 1.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
