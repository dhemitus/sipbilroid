import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldButton extends StatelessWidget {
  final Function? onTap;
  final String? label, title;
  final bool? enable;

  FieldButton({this.onTap, this.label, this.title, this.enable = true});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        padding: EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 8.0.w, bottom: 14.0.w),
        margin: EdgeInsets.only(bottom: 12.0.w),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).colorScheme.inputBackground.withOpacity(.2),
        radius: BorderRadius.circular(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Regular9Text(title ?? '', color: Theme.of(context).colorScheme.inputLabel),
              SimpleBar(
              left: Regular14Text(label ?? '', color: Theme.of(context).colorScheme.inputText, overflow: TextOverflow.ellipsis,),
            ),
          ]
        )
      ),
    );
  }
}
