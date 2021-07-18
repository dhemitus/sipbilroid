import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool? enable;

  PrimaryButton({this.onTap, this.label, this.enable = true});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        color: Theme.of(context).colorScheme.default1Button,
        height: 35.0.w,
        radius: BorderRadius.circular(10.0.w),
        child: Heavy13Text(label ?? '', color: Theme.of(context).colorScheme.defaultTextButton),
        shadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 6.0.w,
            blurRadius: 9.0.w,
            offset: Offset(0, 6.0.w)
          )
        ],
      ),
    );
  }
}
