import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBar extends StatelessWidget {
  final String? title, description, subdescription;

  HeaderBar({this.title, this.description, this.subdescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SimpleBar(
            margin: EdgeInsets.only(top: 48.0.w),
            left: LogoContainer(small: false,),
            right: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Regular16Text(description ?? ''),
                Regular9Text(subdescription ?? '')
              ],
            ),
          ),
          SizedBox(height: 18.0.w,),
          Heavy15Text(title ?? ''),
          SizedBox(height: 8.0.w,)
        ],
      ),
    );
  }
}
