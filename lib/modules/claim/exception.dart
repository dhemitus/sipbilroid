import 'package:sipbilroid/modules/modules.dart';

class ClaimException implements Exception {
  final ClaimModel message;
  ClaimException(this.message);
}
