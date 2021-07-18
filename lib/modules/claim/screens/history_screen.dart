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
  Widget build(BuildContext context) {
    return HistoryTemplate(
      children: [
        Container()
      ],
    );
  }

}