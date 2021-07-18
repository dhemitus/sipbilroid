import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(OnDashboardList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.dashboard != current.dashboard,
      builder: (BuildContext context, DashboardState state) {
        return BottomCard(
          child: Column(
            children: [
              ResumeScreen(),
              MonthlyCard(
                month: state.dashboard.monthly!.bulan!,
                amount: state.dashboard.monthly!.totalKlaim!.toString(),
                transaction: state.dashboard.monthly!.jumlahKlaim!.toString()
              ),
              AnnualCard(
                month: state.dashboard.annual!.bulan!,
                amount: state.dashboard.annual!.totalKlaim!.toString(),
                transaction: state.dashboard.annual!.jumlahKlaim!.toString()
              ),
              BaseContainer(height: 70,)
            ]
          )
        );
      }
    );
  }

}
