import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MapStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class MapModel extends Equatable {
  final String? location, message;
  final LatLng? latLng;

  MapModel({this.message, this.latLng, this.location});

  MapModel copyWith({
    String? location,
    LatLng? latLng,
    String? message
  }) => MapModel(
    location: location ?? this.location,
    latLng: latLng ?? this.latLng,
    message: message ?? this.message
  );

  @override
  List<Object?> get props => [location, latLng, message];
}
