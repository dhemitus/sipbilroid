import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class ExpandBar extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget? left, center, right;

  ExpandBar({this.margin, this.right, this.center, this.left});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      margin: margin ?? null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: left ?? Container()),
          center ?? Container(),
          Expanded(child: right ?? Container())
        ],
      ),
    );
  }
}
