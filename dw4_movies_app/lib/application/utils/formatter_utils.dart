import 'package:intl/intl.dart';

class FormatterUtils {
  FormatterUtils._();

  static String formatDate(String value, String pattern) {
    final dateFormat = DateFormat(pattern);

    return dateFormat.format(
      DateTime.parse(value),
    );
  }
}
