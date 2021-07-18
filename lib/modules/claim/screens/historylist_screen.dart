import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HistoryListScreen extends StatefulWidget {
  @override
  _HistoryListScreenState createState() => _HistoryListScreenState();
}

class _HistoryListScreenState extends State<HistoryListScreen> {

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
        return BottomCard(
          child: Column(
            children: [
              BaseContainer(height: 300,)
            ]
          )
        );
      }
    );

  }

}
