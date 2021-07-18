import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 132.0.w,
      width: 272.0.w,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 18.0.w),
      color: Theme.of(context).colorScheme.blueCard.withOpacity(.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseContainer(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Regular30Text('B 1331 PWW', color: Theme.of(context).colorScheme.labelText,),
                Regular10Text('hshis', color: Theme.of(context).colorScheme.labelText,),
              ],
            )
          ),
          BaseContainer(
            width: 90.0.w,
            height: 60.0.w,
            image: ImageUtils.imageAsset('assets/images/bike.png', fit: BoxFit.contain),
          )
        ],
      ),
      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 6.0.w,
          blurRadius: 9.0.w,
          offset: Offset(0, 6.0.w)
        )
      ],
      radius: BorderRadius.circular(16.0.w),
    );
  }
}
