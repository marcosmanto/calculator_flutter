import 'package:intl/intl.dart';

class Memory {
  final NumberFormat? _numberFormat;
  final String? locale;
  static const operations = ['%', '/', 'x', '-', '+', '='];
  List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastCommand;

  Memory({this.locale}) : _numberFormat = NumberFormat('#,##0.00', locale);

  String get value {
    return _value;
  }

  _allClear() {
    _value = '0';
    _buffer = [0.0, 0.0];
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;

      String valueToDisplay = _numberFormat!.format(_buffer[0]);

      valueToDisplay = RegExp(r'\d+[,\.]\d+').hasMatch(valueToDisplay)
          ? valueToDisplay.split(RegExp(r'[\.,]0+$'))[0]
          : valueToDisplay;

      _value = valueToDisplay;

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
      _wipeValue = !isEqualSign;
    }
  }

  _addDigit(String digit) {
    final bool isDecimalSeparator = RegExp('[,.]').hasMatch(digit);
    final wipeValue = (_value == '0' && !isDecimalSeparator) || _wipeValue;

    // Avoid multiple decimal separators
    if (isDecimalSeparator && _value.contains(',') && !wipeValue) return;

    final emptyValue = isDecimalSeparator ? '0' : '';

    // erase display if wipe is true
    // if wiping value account for imediatly pressing decimal separartor after operation
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] =
        double.tryParse(_value.replaceFirst(RegExp(','), '.')) ?? 0;

    // ignore: avoid_print
    print(_buffer);
  }

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  bool _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        // case user keeping pressing operations button repeatedly
        return _buffer[0];
    }
  }
}
