import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  Output({required this.output});

  String output;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double fontSize = size.height / 15;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Text(output,
              style: TextStyle(fontSize: fontSize, color: Colors.white)),
        )
      ],
    );
  }
}
