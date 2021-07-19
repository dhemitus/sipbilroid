import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryForm extends StatelessWidget {
  final DateTime? value;
  final List<DateTime>? items;
  final Function? onChange;

  HistoryForm({this.onChange, this.items = const [], this.value});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      margin: EdgeInsets.only(left: 30.0.w, top: 16.0.w),
      child: PeriodButton(title: 'Period Bulan: ', value: value, items: items, onChange: onChange,)
    );
  }
}
