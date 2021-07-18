import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnualCard extends StatelessWidget {
  final String? month, amount, transaction;

  AnnualCard({this.transaction, this.amount, this.month});

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
                left: BaseContainer(width: 10.0.w,),
                center: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Heavy10Text('TAHUNAN', color: Theme.of(context).colorScheme.tabOn,),
                    Heavy8Text('SAMPAI DENGAN $month', color: Theme.of(context).colorScheme.tabOn,)
                  ],
                )
              ),
              SizedBox(height: 20.0.w,),
              ExpandBar(
                margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                left: Regular12Text('Total Transaksi'),
                center: Regular12Text(':'),
                right: Regular12Text(transaction ?? ''),
              ),
              ExpandBar(
                margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                left: Regular12Text('Total Rupiah'),
                center: Regular12Text(':'),
                right: Regular12Text('Rp. $amount'),
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
          margin: EdgeInsets.symmetric(horizontal: 60.0.w),
          width: 39.0.w,
          height: 39.0.w,
          image: ImageUtils.imageAsset('assets/images/annual.png'),
        )
      ]
    );
  }
}
