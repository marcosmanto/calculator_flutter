import 'package:calculator_flutter/components/display.dart';
import 'package:calculator_flutter/components/keyboard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  _onPressed(String text) {
    // ignore: avoid_print
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          const Display(text: '123.45'),
          Keyboard(onButtonPressed: _onPressed),
        ]),
      ),
    );
  }
}
