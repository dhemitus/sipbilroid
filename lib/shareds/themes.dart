import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

extension SIPColorScheme on ColorScheme {
  Color get defaultTextButton => Colors.white;
  Color get default1Button => SIPColor.blue0073DE;
  Color get default2Button => SIPColor.grey002B90;

  Color get defaultText => SIPColor.grey6C6C6C;
  Color get defaultBackground => Colors.white;

  Color get blueCard => SIPColor.blue0053FF;

  Color get tabOff => SIPColor.grey6C6C6C;
  Color get tabOn => SIPColor.blue3170F3;

  Color get inputCursor => SIPColor.grey6C6C6C;
  Color get inputBackground => SIPColor.greyCACACA;
  Color get inputText => SIPColor.grey6C6C6C;
  Color get inputHint => SIPColor.grey6C6C6C;
  Color get inputLabel => SIPColor.blue3170F3;
}
