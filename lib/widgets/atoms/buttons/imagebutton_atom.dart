import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageButton extends StatelessWidget {
  final Function? onTap;
  final String? label, url;
  final bool? enable, edit;
  final File? file;

  ImageButton({this.onTap, this.url, this.label, this.enable = true, this.edit = false, this.file});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    DecorationImage _image;

    if(edit!) {
      _image = file == null ? ImageUtils.imageNetwork(url!) : ImageUtils.imageFile(file!);
    } else{
      _image = file == null ? ImageUtils.imageAsset('assets/images/trans.png') : ImageUtils.imageFile(file!);
    }

    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        color: Theme.of(context).colorScheme.inputBackground.withOpacity(.2),
        height: 135.0.w,
        radius: BorderRadius.circular(10.0.w),
        child: Regular14Text(label ?? '', color: Theme.of(context).colorScheme.inputText),
        image: _image
      ),
    );
  }
}
