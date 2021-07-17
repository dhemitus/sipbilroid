import 'package:sipbilroid/modules/modules.dart';

class InitException implements Exception {
  final InitModel message;

  InitException(this.message);
}
