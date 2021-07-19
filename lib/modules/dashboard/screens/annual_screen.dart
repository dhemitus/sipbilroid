import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class AnnualScreen extends StatelessWidget {
  late String _month, _amount, _transaction;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.dashboard.annual != current.dashboard.annual,
      builder: (BuildContext context, DashboardState state) {

        _month = '';
        _amount = '';
        _transaction = '';

        if(state.dashboard.annual != null) {
          _month = state.dashboard.annual!.bulan!;
          _amount = state.dashboard.annual!.totalKlaim!.toString();
          _transaction = state.dashboard.annual!.jumlahKlaim!.toString();
        }


        return AnnualCard(
          month: _month,
          amount: _amount,
          transaction: _transaction
        );
      }
    );
  }

}
