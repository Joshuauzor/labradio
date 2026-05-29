import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final isDeleting = newValue.text.length < oldValue.text.length;

    // Strip everything except digits
    var digits = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    // Limit to 4 digits (mmyy)
    if (digits.length > 4) digits = digits.substring(0, 4);

    if (isDeleting && oldValue.text.endsWith('/')) {
      digits = digits.substring(0, digits.length - 1);
    }

    var formatted = '';
    if (digits.length >= 2) {
      formatted = '${digits.substring(0, 2)}/${digits.substring(2)}';
    } else {
      formatted = digits;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###', 'en_US');
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    if (digits.isEmpty) return TextEditingValue.empty;
    final number = int.parse(digits);
    final newText = _formatter.format(number);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class RemoveLeadingZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    // remove only one leading 0 when length > 1 (e.g. 0812 -> 812)
    if (text.length > 1 && text.startsWith('0')) {
      text = text.replaceFirst(RegExp('^0+'), '');
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
