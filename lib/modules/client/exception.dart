import 'package:sipbilroid/modules/modules.dart';

class ClientException implements Exception {
  final ClientModel message;
  ClientException(this.message);
}
