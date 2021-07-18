import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCard extends StatelessWidget {
  final Widget? child;

  TopCard({this.child});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: child ?? Container(),
      height: 1.sh - 92.0.w,
      image: ImageUtils.imageAsset('assets/images/mask.png'),
      radius: BorderRadius.only(bottomLeft: Radius.circular(20.0.w), bottomRight: Radius.circular(20.0.w)),
      color: Theme.of(context).colorScheme.defaultBackground.withOpacity(0.8),
      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 6.0.w,
          blurRadius: 12.0.w,
          offset: Offset(0, 6.0.w)
        )
      ],
    );
  }

}
