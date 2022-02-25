import 'package:flutter/services.dart';

class TextInputFormatterOnlyNumbers extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty || newValue.text == '-') return newValue;
    final result = double.tryParse(newValue.text.replaceAll(',', '.'));
    if (result == null) return oldValue;
    return newValue.copyWith(text: newValue.text.trim());
  }
}
