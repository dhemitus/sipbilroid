import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class CurrentScreen extends StatefulWidget {
  CurrentScreen({Key? key}) : super(key: ClaimRoutes.current);
  @override
  _CurrentScreenState createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {

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
        return CurrentTemplate(
          children: [
            Container()
          ],
        );
      }
    );
  }

}
