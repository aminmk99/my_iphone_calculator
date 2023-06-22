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
  bool isDivisionPressed = false;
  bool isMultiplePressed = false;
  bool isMinusPressed = false;
  bool isPlusPressed = false;

  @override
  Widget build(BuildContext context) {
    bool test = isDivisionPressed;

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
                      displayFormatFunc('AC');
                    }),
                    text: 'AC'),
                // +/- button
                DisplayFormatButtons(
                    action: () {
                      displayFormatFunc('+/-');
                    },
                    text: '+/-'),
                // % button
                DisplayFormatButtons(
                    action: (() {
                      displayFormatFunc('%');
                    }),
                    text: '%'),
                // division button
                OperatorsButtons(
                    action: () => operatorFunc('÷'),
                    text: '÷',
                    isPressed: isDivisionPressed),
              ],
            ),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('7'), text: '7'),
                NumberButtons(action: (() => numbersFunc('8')), text: '8'),
                NumberButtons(action: (() => numbersFunc('9')), text: '9'),
                OperatorsButtons(
                    action: () => operatorFunc('×'),
                    text: '×',
                    isPressed: isMultiplePressed),
              ],
            ),
            // Third Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('4'), text: '4'),
                NumberButtons(action: () => numbersFunc('5'), text: '5'),
                NumberButtons(action: () => numbersFunc('6'), text: '6'),
                OperatorsButtons(
                    action: () => operatorFunc('-'),
                    text: '−',
                    isPressed: isMinusPressed),
              ],
            ),
            // 4th Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButtons(action: () => numbersFunc('1'), text: '1'),
                NumberButtons(action: () => numbersFunc('2'), text: '2'),
                NumberButtons(action: () => numbersFunc('3'), text: '3'),
                OperatorsButtons(
                    action: () => operatorFunc('+'),
                    text: '+',
                    isPressed: isPlusPressed),
              ],
            ),
            //5th Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZeroButton(action: () => numbersFunc('0'), text: '0'),
                NumberButtons(action: () => floatFunc('.'), text: '.'),
                OperatorsButtons(
                    action: () => calculate(output),
                    text: '=',
                    isPressed: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  displayFormatFunc(String displayFormat) {
    setState(() {
      //AC button
      if (displayFormat == 'AC') {
        setState(() {
          output = '0';
          isDivisionPressed = false;
          isMultiplePressed = false;
          isMinusPressed = false;
          isPlusPressed = false;
          print('AC');
        });
      }
      //% button
      if (displayFormat == '%') {
        // Check if the string consists of digits only
        if (RegExp(r'^\d+$').hasMatch(output)) {
          output = (double.parse(output) / 100).toString();
        }
      }
      // +/- button
      if (displayFormat == '+/-') {
        // Check if the string consists of digits only
        if (RegExp(r'^\d+$').hasMatch(output) || output.startsWith('−')) {
          if (!output.startsWith('-') && output != '0') {
            output = '-' + output;
          } else if (output.startsWith('-')) {
            output = output.replaceAll('-', '');
          }
        }
      }
    });
  }

  numbersFunc(String num) {
    isDivisionPressed = false;
    isMultiplePressed = false;
    isMinusPressed = false;
    isPlusPressed = false;
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

  void operatorFunc(String op) {
    var temp = output.substring(output.length - 1);
    setState(() {
      switch (op) {
        case '÷':
          isDivisionPressed = true;
          isMinusPressed = false;
          isPlusPressed = false;
          isMultiplePressed = false;
          break;
        case '×':
          isMultiplePressed = true;
          isDivisionPressed = false;
          isMinusPressed = false;
          isPlusPressed = false;
          break;
        case '-':
          isMinusPressed = true;
          isDivisionPressed = false;
          isMultiplePressed = false;
          isPlusPressed = false;
          break;
        case '+':
          isPlusPressed = true;
          isMinusPressed = false;
          isDivisionPressed = false;
          isMultiplePressed = false;
          break;
      }
      if (temp == '+' || temp == '-' || temp == '×' || temp == '÷') {
        output = replaceLast(output, op);
      } //
      else {
        output += op;
      }
    });
  }

  String replaceLast(String original, String replacement) {
    return original.substring(0, original.length - 1) + replacement;
  }

  void calculate(String input) {
    List<String> tokens = [];
    List<String> operators = [];
    String currentToken = '';
    bool isUnaryMinus = true; // Assume that the first token is a unary minus
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if (char == '+' || char == '-' || char == '×' || char == '÷') {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        if (char == '-' && isUnaryMinus) {
          // Handle unary minus
          currentToken += '-';
        } else {
          isUnaryMinus = false;
          operators.add(char);
        }
      } else {
        currentToken += char;
        isUnaryMinus = false;
      }
    }
    if (currentToken.isNotEmpty) {
      tokens.add(currentToken);
    }

    // Perform multiplication and division first
    int index = 0;
    while (operators.contains('×') || operators.contains('÷')) {
      if (operators[index] == '×') {
        double result =
            double.parse(tokens[index]) * double.parse(tokens[index + 1]);
        tokens.replaceRange(index, index + 2, [result.toString()]);
        operators.removeAt(index);
      } else if (operators[index] == '÷') {
        double result =
            double.parse(tokens[index]) / double.parse(tokens[index + 1]);
        tokens.replaceRange(index, index + 2, [result.toString()]);
        operators.removeAt(index);
      } else {
        index += 1;
      }
    }

    // Perform addition and subtraction next
    index = 0;
    double result = double.parse(tokens[index]);
    while (operators.isNotEmpty) {
      String operator = operators[index];
      double operand = double.parse(tokens[index + 1]);
      switch (operator) {
        case '+':
          result += operand;
          break;
        case '-':
          result -= operand;
          break;
        default:
          throw Exception('Invalid operator: $operator');
      }
      operators.removeAt(index);
      tokens.replaceRange(index, index + 2, [result.toString()]);
    }

    // Check if the result is an integer
    if (result % 1 == 0) {
      setState(() {
        output = result.toInt().toString();
      });
    } else {
      setState(() {
        output = result
            .toStringAsFixed(8)
            .replaceAll(RegExp(r'0*$'), '')
            .replaceAll(RegExp(r'\.$'), '');
      });
    }
    print(output);
  }
}
