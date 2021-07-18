import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: ClaimRoutes.history);

  @override
  Widget build(BuildContext context) {
    return HistoryTemplate(
      children: [
        HeaderScreen(title: 'HISTORY',),
        VehicleScreen(),
        HistoryListScreen()
      ],
    );
  }
}
