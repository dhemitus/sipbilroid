import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

extension SIPColorScheme on ColorScheme {
  Color get defaultTextButton => Colors.white;
  Color get default1Button => SIPColor.blue0073DE;
  Color get default2Button => SIPColor.grey002B90;

  Color get inputBackground => SIPColor.greyCACACA;
  Color get inputText => SIPColor.grey6C6C6C;
  Color get inputCursor => SIPColor.grey6C6C6C;
  Color get inputHint => SIPColor.grey6C6C6C;
  Color get inputLabel => SIPColor.blue3170F3;
}
