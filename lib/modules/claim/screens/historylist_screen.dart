import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class HistoryListScreen extends StatefulWidget {
  @override
  _HistoryListScreenState createState() => _HistoryListScreenState();
}

class _HistoryListScreenState extends State<HistoryListScreen> {
  late List<DateTime> _dates;
  @override
  void initState() {
    super.initState();
    _parseDate();

    BlocProvider.of<ClaimBloc>(context).add(OnClaimPeriod(Format.shortMonth().format(_dates[0])));
  }

  _onChange(DateTime e) {
    print(Format.shortMonth().format(e));
    BlocProvider.of<ClaimBloc>(context).add(OnClaimPeriod(Format.shortMonth().format(e)));
  }

  _parseDate() {
    DateTime _date = DateTime.now();
    print(_date.month);
    _dates = [];
    int _i;
    for(_i = _date.month-1; _i >= 1; _i--) {
      _dates.add(DateTime(_date.year, _i, 1));
    }

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimBloc, ClaimState>(
      buildWhen: (previous, current) => previous.claim != current.claim,
      builder:(BuildContext context, ClaimState state) {
        List<Widget> _list = [];
        if(state.claim.list != null && state.claim.list!.isNotEmpty) {
          state.claim.list!.map((ClaimModel e) {
            _list.add(ClaimCard(
              claim: Format.fullDate().format( e.tanggalKlaim!),
              amount: Format.currency().format(e.total),
              litre: e.jumlahLiter.toString(),
              status: e.status,
            ));
          }).toList();
        }
        return BottomCard(
          child: Column(
            children: [
              HistoryForm(items: _dates, value: _dates[0], onChange: _onChange),
              Column(
                children: _list,
              ),
              BaseContainer(height: 70,)
            ]
          )
        );
      }
    );

  }

}
