import 'package:intl/intl.dart';
import 'package:labradio/app.dart';

class NumberUtils {
  static String formatCounter(int count) {
    final compactFormatter = NumberFormat.compact(
      locale: currentLocale.languageCode,
    );

    return compactFormatter.format(count);
  }
}
