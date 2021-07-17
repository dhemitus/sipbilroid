import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? child;

  DefaultScaffold({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.defaultBackground,
      extendBody: true,
      body: child,
    );
  }
}
