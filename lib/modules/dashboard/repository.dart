import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DashboardRepository {

  Future<DashboardModel> loadDashboard(VehicleModel vehicle) async {
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

      http.Response _response = await http.get(
        Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.DASHBOARD_PATH}', _params),
        headers: _headers
      );

      print(vehicle.toParam());

      if(_response.statusCode == 200) {
        Map _json = jsonDecode(_response.body);

        print(_json);

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
