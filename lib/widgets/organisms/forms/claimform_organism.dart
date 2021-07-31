import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimForm extends StatelessWidget {
  final TextEditingController? litreController, totalController, locationController;
  final Function? onSubmit, onLoad, onTime, onLocation;
  final Widget? gasoline, vehicle, map;
  final File? receipt;
  final bool? edit, enable;
  final String? url;
  final DateTime? date;

  ClaimForm({this.totalController, this.litreController, this.locationController, this.onLocation, this.onTime, this.onSubmit, this.onLoad, this.gasoline, this.vehicle, this.map, this.receipt, this.edit = false, this.enable = true, this.url, this.date});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        children: <Widget>[
          SizedBox(height: 14.0.w,),
          vehicle ?? Container(),
          DateTimeInput(onChange: onTime, value: date, title: 'Tanggal', enable: enable),
          map ?? Container(),
          gasoline ?? Container(),
          InputText(hint: 'Jumlah Liter', controller: litreController, inputType: TextInputType.number, title: 'Jumlah Liter', enable: enable!),
          InputText(hint: 'Rp.', controller: totalController, inputType: TextInputType.number, title: 'Total Rupiah', enable: enable!),
          ImageButton(label: 'upload receipt', onTap: onLoad, file: receipt, url: url, edit: edit, enable: enable,),
          SizedBox(height: 82.0.w,),
          enable! ? PrimaryButton(label: 'Submit', onTap: onSubmit) : Container(),
          SizedBox(height: 82.0.w,)
        ],
      )
    );
  }
}
