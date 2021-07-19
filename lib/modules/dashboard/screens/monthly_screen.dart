import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class MonthlyScreen extends StatelessWidget {
  late String _month, _amount, _transaction;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.dashboard.monthly != current.dashboard.monthly,
      builder: (BuildContext context, DashboardState state) {

        _month = '';
        _amount = '';
        _transaction = '';

        if(state.dashboard.monthly != null) {
          _month = state.dashboard.monthly!.bulan!;
          _amount = Format.currency().format(state.dashboard.monthly!.totalKlaim!);
          _transaction = state.dashboard.monthly!.jumlahKlaim!.toString();
        }

        return MonthlyCard(
          month: _month,
          amount: _amount,
          transaction: _transaction
        );
      }
    );
  }

}
