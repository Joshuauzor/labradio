import 'dart:io';

import 'package:intl/intl.dart';

class CurrencyUtils {
  static String formatValue(double currency) {
    final formatter = NumberFormat('#,##0.###', 'en_US');
    return formatter.format(currency);
  }

  static String getCurrency({String? currency = 'NGN'}) {
    final format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: currency,
    );
    return format.currencySymbol;
  }
}
