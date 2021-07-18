import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DashboardRepository {

  Future<DashboardModel> loadDashboard() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.DASHBOARD_PATH}'),
        headers: _headers
      );

      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);

        return DashboardModel(
          message: 'success',
          annual: DashboardModel.fromJson(_json['data']['tahunan'][0]),
          monthly: DashboardModel.fromJson(_json['data']['bulanan'][0])
        );
      } else {
        throw DashboardException(DashboardModel(message: 'failed'));
      }

    } catch(e) {
      throw DashboardException(DashboardModel(message: e.toString()));
    }
  }
}
