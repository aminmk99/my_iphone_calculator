import 'package:calculator/widgets/display_format_buttons.dart';
import 'package:calculator/widgets/number_buttons.dart';
import 'package:calculator/widgets/operators_buttons.dart';
import 'package:calculator/widgets/output.dart';
import 'package:calculator/widgets/zero_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double distantFromBottom = 20.0;
  String output = '0';

  TextEditingController _controller = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 18, top: 190),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Output(output: output),
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AC button
                DisplayFormatButtons(
                    action: (() {
                      setState(() {
                        output = '0';
                        print('AC');
                      });
                    }),
                    text: 'AC'),
                // +/- button
                DisplayFormatButtons(
                    action: (() {
                      setState(() {
                        output = output + '+/-';
                        print('+/-');
                      });
                    }),
                    text: '+/-'),
                // % button
                DisplayFormatButtons(action: ((() => print('%'))), text: '%'),
                // division button
                OperatorsButtons(action: () => operatorFunc('÷'), text: '÷'),
              ],
            ),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('7'), text: '7'),
                NumberButtons(action: (() => numbersFunc('8')), text: '8'),
                NumberButtons(action: (() => numbersFunc('9')), text: '9'),
                OperatorsButtons(action: () => numbersFunc('×'), text: '×'),
              ],
            ),
            // Third Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('4'), text: '4'),
                NumberButtons(action: () => numbersFunc('5'), text: '5'),
                NumberButtons(action: () => numbersFunc('6'), text: '6'),
                OperatorsButtons(action: () => numbersFunc('−'), text: '−'),
              ],
            ),
            // 4th Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('1'), text: '1'),
                NumberButtons(action: () => numbersFunc('2'), text: '2'),
                NumberButtons(action: () => numbersFunc('3'), text: '3'),
                OperatorsButtons(action: () => operatorFunc('+'), text: '+'),
              ],
            ),
            //5th Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZeroButton(action: () => numbersFunc('0'), text: '0'),
                NumberButtons(action: () => floatFunc('.'), text: '.'),
                OperatorsButtons(action: ((() => print('='))), text: '='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  numbersFunc(String num) {
    setState(() {
      if (output == '0') {
        output = num;
        print(num);
      } //
      else {
        output = output + num;
        print(num);
      }
    });
  }

  floatFunc(String dot) {
    setState(() {
      output = output + dot;
    });
  }

  operatorFunc(String op) {
    setState(() {
      output = output + op;
    });
  }
}
