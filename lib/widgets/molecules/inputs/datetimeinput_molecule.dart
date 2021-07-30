import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class DateTimeInput extends StatelessWidget {
  final String? title;
  final Function? onChange;
  final DateTime? value;

  DateTimeInput({this.title, this.onChange, this.value});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      radius: BorderRadius.circular(8.0.w),
      margin: EdgeInsets.only(bottom: 12.0.w),
      padding: EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 8.0.w, bottom: 14.0.w),
      color: Theme.of(context).colorScheme.inputBackground.withOpacity(.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Regular9Text(title ?? '', color: Theme.of(context).colorScheme.inputLabel),
          BaseDateTime(
            onChange:onChange,
            value: value,
            fill: Theme.of(context).colorScheme.noColor,
          )
        ]
      )
    );

  }
}
