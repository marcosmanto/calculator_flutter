import 'package:calculator_flutter/components/button.dart';
import 'package:calculator_flutter/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) onButtonPressed;
  final String decimalSeparator;

  const Keyboard(
      {super.key,
      required this.onButtonPressed,
      required this.decimalSeparator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.black,
      child: Column(
        children: [
          ButtonRow(
            buttons: [
              Button.big(
                text: 'AC',
                color: Button.darkColor,
                onPressed: onButtonPressed,
              ),
              Button(
                text: '%',
                color: Button.darkColor,
                onPressed: onButtonPressed,
              ),
              Button.operation(
                text: '/',
                onPressed: onButtonPressed,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '7',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '8',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '9',
                onPressed: onButtonPressed,
              ),
              Button.operation(
                text: 'x',
                onPressed: onButtonPressed,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '4',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '5',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '6',
                onPressed: onButtonPressed,
              ),
              Button.operation(
                text: '-',
                onPressed: onButtonPressed,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button(
                text: '1',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '2',
                onPressed: onButtonPressed,
              ),
              Button(
                text: '3',
                onPressed: onButtonPressed,
              ),
              Button.operation(
                text: '+',
                onPressed: onButtonPressed,
              ),
            ],
          ),
          const SizedBox(height: 1),
          ButtonRow(
            buttons: [
              Button.big(
                text: '0',
                onPressed: onButtonPressed,
              ),
              Button(
                text: decimalSeparator,
                onPressed: onButtonPressed,
              ),
              Button.operation(
                text: '=',
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
