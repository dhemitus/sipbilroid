import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ClaimTemplate extends StatelessWidget {
  final List<Widget>? children;

  ClaimTemplate({this.children = const []});

  @override
  Widget build(BuildContext context) {
    return  StackScaffold(
      bottomExtension: 50,
      background: BaseContainer(
        image: ImageUtils.imageAsset('assets/images/dashboard.png', fit: BoxFit.cover),
      ),
      children: children,
    );
  }
}
