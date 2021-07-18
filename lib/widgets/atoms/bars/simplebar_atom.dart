import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class SimpleBar extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget? left, center, right;

  SimpleBar({this.margin, this.right, this.center, this.left});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      margin: margin ?? null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          left ?? Container(),
          center ?? Container(),
          right ?? Container()
        ],
      ),
    );
  }
}
