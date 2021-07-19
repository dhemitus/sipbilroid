import 'package:intl/intl.dart';

class Format {

  static NumberFormat currency() {
    return NumberFormat.currency(locale: 'id', symbol: '');
  }

  static DateFormat fullDate() {
    return DateFormat('dd MMMM yyyy');
  }

  static DateTime todate(String s) {
    return DateTime.parse(s);
  }

  static DateFormat shortDate() {
    return DateFormat('MMMM yyyy');
  }

  static DateFormat shortMonth() {
    return DateFormat('MM-yyyy');
  }
}
