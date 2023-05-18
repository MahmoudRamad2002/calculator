import 'package:flutter/material.dart';

import 'widget_tab.dart';

class calculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator-screen';

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenstate();
  }
}

class CalculatorScreenstate extends State<calculatorScreen> {
  String resultText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Text(
          'calculator',
          style: TextStyle(fontSize: 32),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                resultText,
                style: TextStyle(fontSize: 42),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonCalculator('7', onDigetclick),
                ButtonCalculator('8', onDigetclick),
                ButtonCalculator('9', onDigetclick),
                ButtonCalculator('/', onOperatorclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonCalculator('4', onDigetclick),
                ButtonCalculator('5', onDigetclick),
                ButtonCalculator('6', onDigetclick),
                ButtonCalculator('*', onOperatorclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonCalculator('1', onDigetclick),
                ButtonCalculator('2', onDigetclick),
                ButtonCalculator('3', onDigetclick),
                ButtonCalculator('-', onOperatorclick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonCalculator('0', onDigetclick),
                ButtonCalculator('.', onDigetclick),
                ButtonCalculator('=', onEquelclick),
                ButtonCalculator('+', onOperatorclick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigetclick(String btnnumber) {
    // print('this function called from calculator btn'' and execute' in calculator screen');
    // resultText+=btnnumber;
    //print(resultText);
    setState(() {
      if (resultText == '0') {
        resultText = btnnumber;
        return;
      }
      resultText += btnnumber;
    });
  }

  String savedNumber = '';
  String savedOperator = '';

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double reslut = 0;
    if (operator == '+') {
      reslut = n1 + n2;
    } else if (operator == '-') {
      reslut = n1 - n2;
    } else if (operator == '*') {
      reslut = n1 * n2;
    } else if (operator == '/') {
      reslut = n1 / n2;
    }
    return reslut.toString();
  }

  void onOperatorclick(String clickedoperator) {
    if (savedOperator.isEmpty) {
      savedNumber = resultText;
      savedOperator = clickedoperator;
      resultText = '0';
      setState(() {});
    } else {
      String Rhs = resultText;
      savedNumber = calculate(savedNumber, savedOperator, Rhs);
      savedOperator = clickedoperator;
      resultText = '0';
      setState(() {});
    }
  }

  void onEquelclick(String _) {
    String Rhs = resultText;
    String res = calculate(savedNumber, savedOperator, Rhs);
    resultText = res;
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }
}
