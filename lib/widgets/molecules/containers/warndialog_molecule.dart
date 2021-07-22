import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarnDialog extends StatelessWidget {
  final String? warn;

  WarnDialog({this.warn});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.w),
      ),
      child: BaseContainer(
        height: 60.0.w,
        child: Regular13Text(warn ?? ''),
      ),
    );
  }
}
