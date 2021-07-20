import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DashboardLoaderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      buildWhen: (previous, current) => previous != current,
      builder: (BuildContext context, VehicleState state) {

        if(state.vehicle.list != null && state.vehicle.list!.isNotEmpty) {
           WidgetsBinding.instance!.addPostFrameCallback((_) {
            print(state.index);
            BlocProvider.of<DashboardBloc>(context).add(OnDashboardList(state.vehicle.list![state.index]));
          });

          return Column(
            children: <Widget>[
              MonthlyScreen(),
              AnnualScreen(),
            ],
          );
        }
        return Container();
      }
    );

  }
}
