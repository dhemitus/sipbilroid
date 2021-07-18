import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClaimScreen extends StatefulWidget {
  ClaimScreen({Key? key}) : super(key: ClaimRoutes.claim);
  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {

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
