import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class BaseDateTime extends StatelessWidget {
  final DateFormat? format;
  final Function? onChange;
  final DateTime? value;
  final Color? fill;
  final bool? enable;

  BaseDateTime({this.format, this.onChange, this.value, this.fill, this.enable = true});

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      enabled: enable!,
      resetIcon: null,
      initialValue: value ?? DateTime.now(),
      format: format ?? DateFormat("yyyy-MM-dd"),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
      onChanged: (date) => onChange?.call(date) ,
      style: Theme.of(context).textTheme.regular14
          .copyWith(color: Theme.of(context).colorScheme.inputText),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(0),
        fillColor: fill,
        filled: true,
        border: InputBorder.none,
      )
    );
  }
}

