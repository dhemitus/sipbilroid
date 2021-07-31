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
  late LocationData _current;
  final TextEditingController _locateController = TextEditingController();

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  MarkerId _id = MarkerId('POM_BBM');
  late GoogleMapController _controller;
  LatLng _initial = LatLng(-6.1751, 106.865);

  @override
  void initState() {
    super.initState();
    _getLocation();
    _setMarker(_initial);
    BlocProvider.of<MapBloc>(context).add(SetMap(MapModel(latLng: _initial)));
  }


  _getLocation() async {
    try {
    late bool _enable;
    PermissionStatus _status;
    _enable = await _location.serviceEnabled();

    if(!_enable) {
      _enable = await _location.requestService();
      if(!_enable) {
        return;
      }
    }

    _status = await _location.hasPermission();
    if(_status == PermissionStatus.denied) {
      _status = await _location.requestPermission();
      if(_status != PermissionStatus.granted) {
        return;
      }
    }

    _current = await _location.getLocation();
    _initial = LatLng(_current.latitude!, _current.longitude!);
    _setMarker(_initial);
    _location.onLocationChanged.listen((LocationData data) {
      setState(() {
        _current = data;
        _initial = LatLng(_current.latitude!, _current.longitude!);
        BlocProvider.of<MapBloc>(context).add(SetMap(MapModel(latLng: _initial)));
        _setMarker(_initial);
      });
    });

    } catch(e) {
      print(e.toString());
    }
  }

  _setMarker(LatLng l) {
    _markers[_id] = Marker(
      markerId: _id,
      position: l,
      icon: BitmapDescriptor.defaultMarker,
      draggable: true,
      onTap: () {
        print('aaa');
      },
      onDragEnd: (position) async {
        BlocProvider.of<MapBloc>(context).add(SetMap(MapModel(latLng: position)));
      }
    );
  }

  void _onMap(GoogleMapController c) {
    _controller = c;
    _location.onLocationChanged.listen((event) async {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(event.latitude!, event.longitude!),
        zoom: 15
      )));
    });
  }

  void _onLocate() {
    BlocProvider.of<MapBloc>(context).add(GetMap(MapModel(location: _locateController.text)));
    print(_locateController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) => previous.map != current.map,
      builder: (BuildContext context, MapState state) {
        WidgetsBinding.instance!.addTimingsCallback((_) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: state.map.latLng!,
            zoom: 15
          )));
          _initial = state.map.latLng!;
          _setMarker(_initial); 

        });
        print(state.map.latLng);
        return MapTemplate(
          map: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: _initial, zoom: 15),
            onMapCreated: _onMap,
            myLocationEnabled: true,
            markers: Set<Marker>.of(_markers.values),
          ),
          controller: _locateController,
          onConfirm: () => Navigator.of(context).pop(),
          onLocate: _onLocate,
        );
      }
    );
  }
}
