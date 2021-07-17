import 'package:sipbilroid/modules/modules.dart';

class OnBoardRepository {

  OnBoardModel loadOnBoards() {
    try {
      return OnBoardModel();
    } catch (e) {
      throw OnBoardException(OnBoardModel(message: e.toString()));
    }
  }
}
