import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class AuthenticationRepository {

  Future<AuthenticationModel>login(AuthenticationModel auth) async {
    try {
      Map<String, String> _headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      http.Response _response = await http.post(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.LOGIN_PATH}'),
        headers: _headers,
        body: auth.toLogin()
      );

      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);
        SharedPreferences _storage = await SharedPreferences.getInstance();

        AuthenticationModel _auth = auth.copyWith(token: _json['token'], refreshToken: _json['refreshToken'], status: _json['status']);

        await _storage.setString('authentication', jsonEncode(_auth.toJson()));
        return _auth;
      } else {
        throw auth.copyWith(message: 'failed');
      }

    } catch (e) {
      throw AuthenticationException(auth.copyWith(message: e.toString()));
    }
  }

  logout() {

  }
}
