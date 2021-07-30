import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class MapDropMenuButton extends StatelessWidget {
  final String? title;
  final Map<String, dynamic>? value;
  final List<Map<String, dynamic>>? items;
  final Function? onChange;

  MapDropMenuButton({this.onChange, this.items = const [], this.value, this.title});

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
          Regular9Text(title ?? '', color: Theme.of(context).colorScheme.tabOn),
          BaseContainer(
            child: DropdownButtonFormField<Map<String, dynamic>>(
              iconEnabledColor: Theme.of(context).colorScheme.tabOn,
              iconDisabledColor: Theme.of(context).colorScheme.tabOn,
              disabledHint: Regular14Text(value!['plate']!, color: Theme.of(context).colorScheme.inputText),
              value: value,
              onChanged: (Map<String, dynamic>? val) => onChange?.call(val!),
              items: items!.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic> item) {
                return DropdownMenuItem(child: Regular14Text(item['plate'], color: Theme.of(context).colorScheme.inputText), value: item,);
              }).toList(),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(0),
                enabledBorder: InputBorder.none
              )
            ),
          ),
        ],
      )
    );
  }
}
