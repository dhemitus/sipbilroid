import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehicleListScreen extends StatefulWidget {
  final Function? onChange;
  final String? plate;

  VehicleListScreen({this.onChange, this.plate});

  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {

  _onChange(int i, CarouselPageChangedReason r) {
    BlocProvider.of<VehicleBloc>(context).add(OnVehicleSlide(i));
  }

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
  
        List<Map<String, dynamic>> _list = [{'id':0, 'plate': 'Pilih kendaraan'}];
        Map<String, dynamic> _value = {};
        if(state.vehicle.list != null && state.vehicle.list!.isNotEmpty) {
          state.vehicle.list!.map((VehicleModel e) { 
            _list.add({'id': e.kendaraanId, 'plate': e.nomorPolisi});
          }).toList();

          if(widget.plate != null) {
            _value = _list.singleWhere((Map<String, dynamic> e) => e['plate'] == widget.plate!);
          } else {
            _value = _list[0];
          }
        }
        return MapDropMenuButton(value: _value, items: _list, onChange: widget.onChange,);
      }
    );
  }

}
