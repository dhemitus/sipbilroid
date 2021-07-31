import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackScaffold extends StatelessWidget {
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final double bottomExtension;
  final Widget? header, background;

  StackScaffold({this.children, this.padding, this.bottomExtension = 110, this.header, this.background});

  @override
  Widget build(BuildContext context) {
    List<Widget> shownChildren = children ?? [];
    shownChildren.add(
      Expanded(
          child: Container(
            height: 0,
            color: Theme.of(context).colorScheme.defaultBackground.withOpacity(0.8),
          )
        )
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.defaultBackground,
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          background ?? Container(),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: max(5, .97.sh)),
                child: SingleChildScrollView(
                  padding: padding,
                  child: IntrinsicHeight(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: shownChildren,
                  ),
                  )
                ),
              );
            }
          ),
          header ?? Container(),
        ]
      )
    );
  }
}
