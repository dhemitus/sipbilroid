import 'package:sipbilroid/modules/modules.dart';

class MapRepository {

  Future<MapModel> setLocation(MapModel map) async {
    try {
      return MapModel(latLng: map.latLng, message: 'success');
    } catch(e) {
      throw MapException(MapModel(message: e.toString()));
    }
  }
}
