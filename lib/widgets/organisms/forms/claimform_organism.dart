import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimForm extends StatelessWidget {
  final TextEditingController? litreController, totalController, locationController;
  final Function? onSubmit, onLoad, onTime;
  final Widget? gasoline, vehicle;
  final File? receipt;

  ClaimForm({this.totalController, this.litreController, this.locationController, this.onTime, this.onSubmit, this.onLoad, this.gasoline, this.vehicle, this.receipt});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        children: <Widget>[
          vehicle ?? Container(),
          DateTimeInput(onChange: onTime,),
          InputText(hint: 'Lokasi', controller: locationController),
          gasoline ?? Container(),
          InputText(hint: 'Jumlah Liter', controller: litreController, inputType: TextInputType.number,),
          InputText(hint: 'Total Rupiah', controller: totalController, inputType: TextInputType.number,),
          SizedBox(height: 10.0.w),
          ImageButton(label: 'upload receipt', onTap: onLoad, file: receipt,),
          SizedBox(height: 82.0.w,),
          PrimaryButton(label: 'Login', onTap: onSubmit),
          SizedBox(height: 82.0.w,)
        ],
      )
    );
  }
}
