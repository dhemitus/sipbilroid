import 'package:sipbilroid/modules/modules.dart';

class OnBoardException implements Exception {
  OnBoardModel message;

  OnBoardException(this.message);
}
