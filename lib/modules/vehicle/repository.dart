import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class VehicleRepository {

  Future<VehicleModel> loadVehcles() async {
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();
      String _string = _storage.getString('authentication')!;

      AuthenticationModel _auth = AuthenticationModel.fromString(_string);
      print(_auth.authorization);

      Map<String, String> _headers = {
        'Authorization': _auth.authorization
      };

      http.Response _response = await http.get(Uri.http(ConfigNet.DOMAIN, '${ConfigNet.MAIN_PATH}${ConfigNet.VERSION}${ConfigNet.VEHICLE_PATH}'),
        headers: _headers
      );

      if(_response.statusCode == 200) {
        print(_response.body);
      }

      return VehicleModel();
    } catch (e){
      throw VehicleException(VehicleModel(message: e.toString()));
    }
  }
}
