import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardTemplate extends StatelessWidget {
  final List<Widget>? children;
  final bool? change;
  final Function? onTap;

  OnBoardTemplate({this.children = const [], this.change = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  StackScaffold(
      bottomExtension: 0,
      background: BaseContainer(
        image: ImageUtils.imageAsset('assets/images/dashboard.png', fit: BoxFit.cover),
      ),
      children: <Widget>[
        TopCard(
          child: OnBoardContainer(
            items: children,
          ),
        ),
        BaseContainer(
          width: 142.0.w,
          padding: EdgeInsets.only(top: 24.0.w),
          child: change! ? PrimaryButton(label: 'Next', onTap: onTap) : LogoContainer()
        )
      ],
    );
  }
}
