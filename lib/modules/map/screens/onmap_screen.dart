import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class OnMapScreen extends StatelessWidget {
  final Function? onLocation;
  final Function(String)? onResult;
  final String? location;
  final bool enable;

  OnMapScreen({this.onLocation, this.onResult, this.location = 'Jalan ...', this.enable = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) => previous.map.latLng != current.map.latLng,
      builder: (BuildContext context, MapState state) {
        print(state.map.latLng);
        WidgetsBinding.instance!.addPostFrameCallback((_) { 
          onResult!(state.map.location!);
        });
        return FieldButton(label: state.map.location ?? location, title: 'Lokasi', onTap: onLocation, enable: enable);
      }
    );

  }
}
