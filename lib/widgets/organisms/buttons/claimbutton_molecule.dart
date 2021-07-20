import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimButton extends StatelessWidget {
  final String? claim, amount, litre, status;
  final Function? onTap;

  ClaimButton({this.claim, this.amount, this.litre, this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!.call(),
      child: ClaimCard(claim: claim, amount: amount, litre: litre, status: status,),
    );
  }
}
