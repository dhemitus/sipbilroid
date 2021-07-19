import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class CurrentListScreen extends StatefulWidget {
  @override
  _CurrentListScreenState createState() => _CurrentListScreenState();
}

class _CurrentListScreenState extends State<CurrentListScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClaimBloc>(context).add(OnClaimList());
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
              claim: DateFormat('dd MMMM yyyy').format( e.tanggalKlaim!),
              amount: Format.currency().format(e.total),
              litre: e.jumlahLiter.toString(),
              status: e.status,
            ));
          }).toList();
        }
        return BottomCard(
          child: Column(
            children: [
              ResumeScreen(),
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
