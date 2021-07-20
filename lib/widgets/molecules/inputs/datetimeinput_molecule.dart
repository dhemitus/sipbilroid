import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class DateTimeInput extends StatelessWidget {
  final String? title;
  final Function? onChange;
  final DateTime? value;

  DateTimeInput({this.title, this.onChange, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Regular9Text(title ?? ''),
        BaseDateTime(onChange:onChange, value: value)
      ],
    );

  }
}
