import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class MapTemplate extends StatelessWidget {
  final List<Widget>? children;
  final Widget? map;
  final Function? onConfirm;

  MapTemplate({this.children = const [], this.map, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return SimpleStackScaffold(
      bottomExtension: 0,
      background: map ?? Container(),
      header: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BaseContainer(
            height: 140.0.w,
            padding: EdgeInsets.only(left: 50.0.w,top: 80.0.w, right: 50.0.w),
            child: InputText(hint: 'Pilih lokasi', solid: true),
          ),
          BaseContainer(
            padding: EdgeInsets.only(left: 50, bottom: 60, right: 50),
            child: PrimaryButton(label: 'Konfirmasi Lokasi', onTap: onConfirm),
          )
        ]
      )
    );
  }
}
