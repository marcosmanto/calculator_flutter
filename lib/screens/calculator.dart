import 'package:calculator_flutter/components/display.dart';
import 'package:calculator_flutter/components/keyboard.dart';
import 'package:calculator_flutter/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:intl/number_symbols_data.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();

  String getCurrentLocale() {
    final locale = ui.window.locale;
    final joined = "${locale.languageCode}_${locale.countryCode}";
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  String getDecimalSeparator(String locale) {
    return numberFormatSymbols[locale]?.DECIMAL_SEP ?? "";
  }
}

class _CalculatorState extends State<Calculator> {
  late final Memory _memory;
  late final String _locale;

  @override
  void initState() {
    _locale = widget.getCurrentLocale();
    _memory = Memory(locale: _locale);
    super.initState();
  }

  _onPressed(String text) {
    // ignore: avoid_print
    print(text);

    setState(() => _memory.applyCommand(text));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Display(
            text: _memory.value,
          ),
          Keyboard(
              onButtonPressed: _onPressed,
              decimalSeparator: widget.getDecimalSeparator(_locale)),
        ]),
      ),
    );
  }
}
