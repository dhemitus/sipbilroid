import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: ClaimRoutes.history);
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClaimBloc>(context).add(OnClaimPeriod('06-2021'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimBloc, ClaimState>(
      buildWhen: (previous, current) => previous.claim != current.claim,
      builder:(BuildContext context, ClaimState state) {
        print(state.claim);
        return HistoryTemplate(
          children: [
            HeaderScreen(title: 'HISTORY',),
            VehicleScreen(),
            Container()
          ],
        );
      }
    );

  }

}
