import 'package:calculator_flutter/components/display.dart';
import 'package:calculator_flutter/components/keyboard.dart';
import 'package:calculator_flutter/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String text) {
    // ignore: avoid_print
    print(text);
    setState(() => memory.applyCommand(text));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Display(text: memory.value),
          Keyboard(onButtonPressed: _onPressed),
        ]),
      ),
    );
  }
}
