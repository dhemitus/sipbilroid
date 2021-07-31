import 'package:sipbilroid/modules/modules.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRepository {

  Future<MapModel> setLocation(MapModel map) async {
    try {

      List<Placemark> placemarks = await placemarkFromCoordinates(map.latLng!.latitude, map.latLng!.longitude);

      return MapModel(latLng: map.latLng, message: 'set success', location: placemarks.first.street);
    } catch(e) {
      throw MapException(MapModel(message: e.toString()));
    }
  }

  Future<MapModel> getLocation(MapModel map) async {
    try {
      List<Location> location = await locationFromAddress(map.location!);

      Location _loc = location.first;
      return map.copyWith(message: 'get success', latLng: LatLng(_loc.latitude, _loc.longitude));
    } catch (e) {
      throw MapException(MapModel(message: e.toString()));
    }
  }
}
