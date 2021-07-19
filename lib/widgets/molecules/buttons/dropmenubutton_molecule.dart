import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DropMenuButton extends StatelessWidget {
  final String? title;
  final DateTime? value;
  final List<DateTime>? items;
  final Function? onChange;

  DropMenuButton({this.onChange, this.items = const [], this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Regular13Text(title ?? '', color: Theme.of(context).colorScheme.tabOn),
        BaseContainer(
          width: 124.0.w,
          child: DropdownButtonFormField<DateTime>(
            iconEnabledColor: Theme.of(context).colorScheme.tabOn,
            iconDisabledColor: Theme.of(context).colorScheme.tabOn,
            disabledHint: Heavy13Text( Format.shortDate().format(value!), color: Theme.of(context).colorScheme.tabOn),
            value: value,
            onChanged: (DateTime? val) => onChange?.call(val!),
            items: items!.map<DropdownMenuItem<DateTime>>((DateTime item) {
              return DropdownMenuItem(child: Heavy13Text(Format.shortDate().format(item), color: Theme.of(context).colorScheme.tabOn), value: item,);
            }).toList(),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none
            )
          ),
        ),
      ],
    );
  }
}
