import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class DropMenuButton extends StatelessWidget {
  final String? title;
  final String? value;
  final List<String>? items;
  final Function? onChange;

  DropMenuButton({this.onChange, this.items = const [], this.value, this.title});

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
          DropdownButtonFormField<String>(
            iconEnabledColor: Theme.of(context).colorScheme.tabOn,
            iconDisabledColor: Theme.of(context).colorScheme.tabOn,
            disabledHint: Regular14Text(value!, color: Theme.of(context).colorScheme.inputText),
            value: value,
            onChanged: (String? val) => onChange?.call(val!),
            items: items!.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem(child: Regular14Text(item, color: Theme.of(context).colorScheme.inputText), value: item,);
            }).toList(),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(0),
              enabledBorder: InputBorder.none
            )
          ),
        ],
      )
    );
  }
}
