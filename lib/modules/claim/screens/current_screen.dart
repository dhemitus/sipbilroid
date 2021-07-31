import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class CurrentScreen extends StatelessWidget {
  CurrentScreen({Key? key}) : super(key: ClaimRoutes.current);

  @override
  Widget build(BuildContext context) {
    return CurrentTemplate(
      children: [
        HeaderScreen(title: 'CURRENT MONTH',),
        VehicleScreen(),
        CurrentLoaderScreen()
      ],
    );
  }

}
