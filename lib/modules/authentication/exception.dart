import 'package:sipbilroid/modules/modules.dart';
class AuthenticationException implements Exception {
  final AuthenticationModel message;

  AuthenticationException(this.message);
}
