import 'package:sipbilroid/modules/modules.dart';
import 'package:geocoding/geocoding.dart';

class MapRepository {

  Future<MapModel> setLocation(MapModel map) async {
    try {
    print('jalan');
      List<Placemark> placemarks = await placemarkFromCoordinates(map.latLng!.latitude, map.latLng!.longitude);
      print(placemarks.first);
      return MapModel(latLng: map.latLng, message: 'success', location: placemarks.first.street);
    } catch(e) {
      throw MapException(MapModel(message: e.toString()));
    }
  }
}
