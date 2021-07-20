import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldButton extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool? enable;

  FieldButton({this.onTap, this.label, this.enable = true});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        padding: EdgeInsets.only(left: 10.0.w),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).colorScheme.inputBackground.withOpacity(.2),
        height: 45.0.w,
        radius: BorderRadius.circular(10.0.w),
        child: Regular14Text(label ?? '', color: Theme.of(context).colorScheme.inputText),
      ),
    );
  }
}
