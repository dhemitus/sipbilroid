import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class GasolineRepository {

  Future<GasolineModel> loadGasolines() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.GASOLINE_PATH}'),
        headers: _headers
      );

      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);
        GasolineModel _gasoline = GasolineModel.fromJsonList(_json['data']);

        return _gasoline;
      } else {
        throw GasolineException(GasolineModel(message: 'failed'));
      }
    }catch(e) {
      throw GasolineException(GasolineModel(message: e.toString()));
    }
  }
}
