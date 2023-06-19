import 'package:flutter/services.dart';

class UpperCaseText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    return TextEditingValue(
        text: capitaLize(newValue.text), selection: newValue.selection);
  }

  String capitaLize(String value) {
    if (value.trim().isEmpty) return "";
    return value.toUpperCase();
  }
}
