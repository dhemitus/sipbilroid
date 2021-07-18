import 'package:sipbilroid/modules/modules.dart';

class DashboardException implements Exception {
  final DashboardModel message;
  DashboardException(this.message);
}
