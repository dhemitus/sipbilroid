import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ClaimRepository {

  Future<ClaimModel> loadList() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.CLAIM_LIST_PATH}'),
        headers: _headers
      );
      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);
        ClaimModel _claim = ClaimModel.fromJsonList(_json['data']);

        return _claim;
      } else {
        throw ClaimException(ClaimModel(message: 'failed'));
      }

    } catch(e) {
      throw ClaimException(ClaimModel(message: e.toString()));
    }
  }

  Future<ClaimModel> loadPeriod(String i) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      Map<String, String> _params = {
        'periode' : i
      };

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.CLAIM_LIST_PATH}', _params),
        headers: _headers
      );
      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);
        ClaimModel _claim = ClaimModel.fromJsonList(_json['data']);

        return _claim;
      } else {
        throw ClaimException(ClaimModel(message: 'failed'));
      }

    } catch(e) {
      throw ClaimException(ClaimModel(message: e.toString()));
    }
  }
}
