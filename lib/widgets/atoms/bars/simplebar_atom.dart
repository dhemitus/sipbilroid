import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class SimpleBar extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget? left, center, right;
  final MainAxisAlignment? alignment;

  SimpleBar({this.margin, this.right, this.center, this.left, this.alignment});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      margin: margin ?? null,
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.spaceBetween,
        children: <Widget>[
          left ?? Container(),
          center ?? Container(),
          right ?? Container()
        ],
      ),
    );
  }
}
