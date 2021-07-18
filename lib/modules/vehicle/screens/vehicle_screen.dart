import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class VehicleScreen extends StatefulWidget {
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<VehicleBloc>(context).add(OnVehicleList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      buildWhen: (previous, current) => previous.vehicle != current.vehicle,
      builder: (BuildContext context, VehicleState state) {
        print(state.vehicle.list);
        List<Widget> _list = [];

        if(state.vehicle.list != null && state.vehicle.list!.isNotEmpty) {
          state.vehicle.list!.map((VehicleModel e) { 
            _list.add(HeaderCard(plate: e.nomorPolisi, type: e.jenisKendaraan, vehicle: e.tipeKendaraan,));
          }).toList();
        }

        return VehicleContainer(
          items: _list,
        );
      }
    );
  }

}
