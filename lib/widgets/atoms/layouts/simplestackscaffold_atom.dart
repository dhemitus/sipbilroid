import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class SimpleStackScaffold extends StatelessWidget {
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final double bottomExtension;
  final Widget? header, background;

  SimpleStackScaffold({this.children, this.padding, this.bottomExtension = 110, this.header, this.background});

  @override
  Widget build(BuildContext context) {
    List<Widget> shownChildren = children ?? [];
    shownChildren.add(SizedBox(height: bottomExtension));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.defaultBackground,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          background ?? Container(),
          header ?? Container(),
        ]
      )
    );
  }
}
