import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class ClaimTemplate extends StatelessWidget {
  final List<Widget>? children;

  ClaimTemplate({this.children = const []});

  @override
  Widget build(BuildContext context) {
    return  StackScaffold(
      children: children,
    );
  }
}
