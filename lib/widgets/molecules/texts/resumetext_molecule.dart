import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ResumeText extends StatelessWidget {
  final String? title, money;

  ResumeText({this.title, this.money});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12.0.w,),
        Regular13Text(title ?? '', color: Theme.of(context).colorScheme.tabOn,),
        CurrencyText(text: money,)
      ],
    );
  }
}
