import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SIPTextTheme on TextTheme {
  TextStyle get heavy13 => GoogleFonts.nunitoSans(
    textStyle: TextStyle(
      fontSize: 13.0.sp,
      letterSpacing: 0.4.sp,
      fontWeight: FontWeight.w700
    )
  );

  TextStyle get regular14 => GoogleFonts.nunitoSans(
    textStyle: TextStyle(
      fontSize: 14.0.sp,
      letterSpacing: 0.4.sp,
      fontWeight: FontWeight.w400
    )
  );

  TextStyle get regular9 => GoogleFonts.nunitoSans(
    textStyle: TextStyle(
      fontSize: 9.0.sp,
      letterSpacing: 0.4.sp,
      fontWeight: FontWeight.w400
    )
  );

  TextStyle get regular8 => GoogleFonts.nunitoSans(
    textStyle: TextStyle(
      fontSize: 8.0.sp,
      letterSpacing: 0.4.sp,
      fontWeight: FontWeight.w400
    )
  );
}
