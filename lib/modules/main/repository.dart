import 'package:sipbilroid/modules/modules.dart';

class MainRepository {

  MainModel loadTabs() {
    try {
      return MainModel(list: tabsList);
    } catch(e) {
      throw MainException(MainModel(message: e.toString()));
    }
  }

  MainModel setIndex(MainModel index) {
    try {
      return index;
    } catch(e) {
      throw MainException(MainModel(message: e.toString()));
    }
  }
}
