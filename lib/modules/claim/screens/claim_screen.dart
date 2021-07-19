import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClaimScreen extends StatelessWidget {
  ClaimScreen({Key? key}) : super(key: ClaimRoutes.claim);

  @override
  Widget build(BuildContext context) {
    return ClaimTemplate(
      children: [
        GasolineScreen(),
        Container()
      ],
    );
  }

}
