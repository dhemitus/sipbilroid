import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoContainer extends StatelessWidget {
  final bool? small;

  LogoContainer({this.small = true});

  @override
  Widget build(BuildContext context) {
    late double _height, _width;

    if(small!) {
      _height = 42.0.w;
      _width = 35.0.w;
    } else {
      _height = 62.0.w;
      _width = 52.0.w;

    }

    return BaseContainer(height: _height, width: _width, image: ImageUtils.imageAsset('assets/images/logo.png'),);
  }
}
