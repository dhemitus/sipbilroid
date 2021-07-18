import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';


class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      buildWhen: (previous, current) => previous.vehicle != current.vehicle,
      builder: (BuildContext context, VehicleState state) {
        int _current = 0;
        if(state.vehicle.list != null && state.vehicle.list!.isNotEmpty) {
          _current = state.vehicle.list![0].sisaAnggaranBulanan!;
        }
        return ResumeText(title: 'SISA ANGGARAN BULANAN', money: _current.toString(),);
      }
    );

  }
}
