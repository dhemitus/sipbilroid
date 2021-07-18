import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class HistoryTemplate extends StatelessWidget {
  final List<Widget>? children;

  HistoryTemplate({this.children = const []});

  @override
  Widget build(BuildContext context) {
    return  StackScaffold(
      children: children,
    );
  }
}
