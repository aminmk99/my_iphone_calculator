import 'package:flutter/material.dart';

class ZeroButton extends StatelessWidget {
  ZeroButton({required this.action, required this.text});

  VoidCallback action;
  late Size size;
  String text;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double paddSize = size.height / 55;
    double fontSize = size.height / 20;
    double buttonSize = size.width / 5.9;
    
    return Container(
      width: buttonSize * 2.4,
      height: buttonSize,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          onTap: action,
          child: Row(
            children: [
              SizedBox(
                width: size.width/15,
              ),
              Text('0', style: TextStyle(fontSize: fontSize, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
