import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardContainer extends StatelessWidget {

  BoardContainer();

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      margin: EdgeInsets.symmetric(vertical: 10.0.w),
      height: 130.w,
      width: 270.w,
      image: ImageUtils.imageAsset('assets/images/header.png', fit: BoxFit.cover),
    );
  }
}
