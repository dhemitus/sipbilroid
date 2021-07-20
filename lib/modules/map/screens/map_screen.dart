import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {

  MapScreen({Key? key}) : super(key: MapRoutes.key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location _location = Location();
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  MarkerId _id = MarkerId('POM_BBM');
  late GoogleMapController _controller;
  late LatLng _latLng;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.1751, 106.865),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((event) async {

      _markers[_id] = Marker(
        markerId: _id,
        position: LatLng(event.latitude!, event.longitude!),
        icon: BitmapDescriptor.defaultMarker,
        draggable: false,
        onTap: () {
          print('aaa');
        },
        onDragEnd: (position) {

        }
      );
      setState(() {
        _latLng = LatLng(event.latitude!, event.longitude!);
      });

    });
  }

  void _onMap(GoogleMapController c) {
    setState(() {
      _controller = c;
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _latLng, zoom: 15)
    ));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMap,
            //myLocationEnabled: true,
            markers: Set<Marker>.of(_markers.values),
            onCameraIdle: (){
              Marker _mark = _markers[_id]!;
              Marker _marker = _mark.copyWith(
                positionParam: _latLng
              );
              setState(() {
                _markers[_id] = _marker;
              });
            },
            onCameraMove: (position){
              Marker _mark = _markers[_id]!;
              Marker _marker = _mark.copyWith(
                positionParam: position.target
              );
              setState(() {
                _latLng = position.target;
                _markers[_id] = _marker;
                BlocProvider.of<MapBloc>(context).add(SetMap(MapModel(latLng: _latLng)));
              });
            }
          )
        ],
      ),
    );
  }
}
