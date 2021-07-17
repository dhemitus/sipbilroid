import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipbilroid/modules/modules.dart';

class InitRepository {
  Future<InitModel> setInit(InitModel init) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      bool _result = await _storage.setString('init', init.init!);
      if(_result) {
        return init.copyWith(message: 'success');
      } else {
        throw InitException(init.copyWith(message: 'failed'));
      }
    } catch (e) {
      throw InitException(init.copyWith(message: e.toString()));
    }
  }

  Future<InitModel> getInit() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _init = _storage.getString('init') ?? InitModel.onBoard;

      return InitModel(init: _init, message: 'success');
    } catch(e) {
      throw InitException(InitModel(message: e.toString()));
    }
  }
}
