import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

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
        print(state.claim);
        return BottomCard(
          child: Column(
            children: [
              ResumeScreen(),
              BaseContainer(height: 300,)
            ]
          )
        );
      }
    );
  }

}