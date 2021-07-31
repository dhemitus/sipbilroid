import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkButton extends StatelessWidget {
  final Function? onTap;
  final bool? enable;
  final Widget? icon;

  MarkButton({this.onTap, this.icon, this.enable = true});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        height: 35.0.w,
        width: 35.0.w,
        child: icon,
      ),
    );
  }
}
