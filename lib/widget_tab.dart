import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  String number;
  Color backgroundColor;
  Function onbtnclickback;

  ButtonCalculator(this.number, this.onbtnclickback,
      {this.backgroundColor = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(1),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor)),
          onPressed: () {
            print(number);
            onbtnclickback(number);
          },
          child: Text(
            number,
            style: TextStyle(fontSize: 28),
          )),
    ));
  }
}
