import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class OnMapScreen extends StatelessWidget {
  final Function? onLocation;
  
  OnMapScreen({this.onLocation});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) => previous.map.latLng != current.map.latLng,
      builder: (BuildContext context, MapState state) {
        print(state.map.latLng);
        return FieldButton(label: state.map.location ?? 'Lokasi', onTap: onLocation);
      }
    );

  }
}
