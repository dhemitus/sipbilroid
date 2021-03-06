import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ResumeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      buildWhen: (previous, current) => previous != current,
      builder: (BuildContext context, VehicleState state) {
        int _current = 0;

        print('index ${state.index}');

        if(state.vehicle.list != null && state.vehicle.list!.isNotEmpty) {
          _current = state.vehicle.list![state.index].sisaAnggaranBulanan!;
        }
        return ResumeText(title: 'SISA ANGGARAN BULANAN', money: Format.currency().format(_current),);
      }
    );

  }
}
