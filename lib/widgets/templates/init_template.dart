import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class InitTemplate extends StatelessWidget {
  final Widget? child;

  InitTemplate({this.child});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: child ?? Container(),
    );
  }
}
