class Memory {
  static const operations = ['%', '/', 'x', '-', '+', '='];
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? operation;
  String _value = '0';
  bool _wipeValue = false;

  String get value {
    return _value;
  }

  _allClear() {
    _value = '0';
  }

  _setOperation(String newOperation) {
    _wipeValue = true;
  }

  _addDigit(String digit) {
    if (digit == ',') digit = '.';
    final wipeValue = _value == '0' || _wipeValue;
    // erase display if wipe is true
    final currentValue = wipeValue ? '' : _value;
    _value = currentValue + digit;
    _wipeValue = false;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }
}
