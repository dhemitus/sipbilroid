import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ClaimRepository {

  Future<ClaimModel> sendClaim(Map<String, dynamic> data) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': _auth.authorization
      };

      print(data);
      http.Response _response = await http.post(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.CLAIM_REQUEST_PATH}'),
        headers: _headers,
        body: data
      );

        print(_response.body);
      if(_response.statusCode == 200) {
        print(data);
      }
      return ClaimModel();
    } catch(e) {
      throw ClaimException(ClaimModel(message: e.toString()));
    }
  }

  Future<ClaimModel> updateClaim(Map<String, dynamic> data) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': _auth.authorization
      };

      print(data);

      http.Response _response = await http.patch(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.CLAIM_UPDATE_PATH}'),
        headers: _headers,
        body: data
      );

        print(_response.body);
      if(_response.statusCode == 200) {
        print(data);
      }
      return ClaimModel();
    } catch(e) {
      throw ClaimException(ClaimModel(message: e.toString()));
    }
  }

  Future<ClaimModel> loadList(VehicleModel vehicle) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      Map<String, dynamic> _params = {
        'where': jsonEncode(vehicle.toParam())
      };

      print(vehicle.toParam());

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

  Future<ClaimModel> loadDetail(ClaimModel detail) async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.CLAIM_DETAIL_PATH}', detail.toDetail()),
        headers: _headers
      );

      print(_response.body);
      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);
        ClaimModel _claim = ClaimModel.fromJson(_json['data']);

        return _claim;
      } else {
        throw ClaimException(ClaimModel(message: 'failed'));
      }



    } catch(e) {
      throw ClaimException(ClaimModel(message: e.toString()));
    }
  }
}
