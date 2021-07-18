import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimCard extends StatelessWidget {
  final String? claim, amount, litre, status;

  ClaimCard({this.claim, this.amount, this.litre, this.status});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseContainer(
          margin: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 15.0.w),
          padding: EdgeInsets.all(14.0.w),
          color: Theme.of(context).colorScheme.defaultBackground,
          child: Column(
            children: <Widget>[
              SimpleBar(
                left: Expanded(child: BaseContainer(width: 10.0.w,)),
                right: Heavy12Text(claim ?? '', color: Theme.of(context).colorScheme.tabOn),
              ),
              SizedBox(height: 10.0.w,),
              ExpandBar(
                margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                left: Regular12Text('Jumlah Liter'),
                center: Regular12Text(':'),
                right: Regular12Text(litre ?? ''),
              ),
              ExpandBar(
                margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                left: Regular12Text('Rupiah'),
                center: Regular12Text(':'),
                right: Regular12Text('Rp. $amount'),
              ),
              ExpandBar(
                margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                left: Regular12Text('Status'),
                center: Regular12Text(':'),
                right: Regular12Text(status ?? ''),
              ),
              SizedBox(height: 8.0.w,)
            ],
          ),
          shadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 6.0.w,
              blurRadius: 9.0.w,
              offset: Offset(0, 6.0.w)
            )
          ],
          radius: BorderRadius.circular(10.0.w),
        ),
        BaseContainer(
          margin: EdgeInsets.symmetric(horizontal: 32.0.w),
          width: 40.0.w,
          height: 32.0.w,
          image: ImageUtils.imageAsset('assets/images/nozzle.png'),
        )
      ]
    );
  }
}
