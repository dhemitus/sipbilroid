import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class TabScaffold extends StatelessWidget {
  final Widget? child;
  final Widget? tabBar;

  TabScaffold({this.tabBar, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.defaultBackground,
      extendBody: true,
      body: child,
      bottomNavigationBar: tabBar,
    );
  }
}
