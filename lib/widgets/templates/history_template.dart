import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class HistoryTemplate extends StatelessWidget {
  final List<Widget>? children;

  HistoryTemplate({this.children = const []});

  @override
  Widget build(BuildContext context) {
    return  StackScaffold(
      background: BaseContainer(
        image: ImageUtils.imageAsset('assets/images/dashboard.png', fit: BoxFit.cover),
      ),
      children: children,
    );
  }
}
