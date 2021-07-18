import 'package:sipbilroid/modules/modules.dart';

class GasolineException implements Exception {
  final GasolineModel message;
  GasolineException(this.message);
}
