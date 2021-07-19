import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class BaseDateTime extends StatelessWidget {
  final DateFormat? format;
  final Function? onChange;

  BaseDateTime({this.format, this.onChange});

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      resetIcon: null,
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
        fillColor: Theme.of(context).colorScheme.inputBackground.withOpacity(.2),
        filled: true,
        border: InputBorder.none,
      )
    );
  }
}

