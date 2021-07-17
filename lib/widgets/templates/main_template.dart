import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class MainTemplate extends StatelessWidget {
  final Widget? child;

  MainTemplate({this.child});

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      child: child ?? Container(),
    );
  }
}
