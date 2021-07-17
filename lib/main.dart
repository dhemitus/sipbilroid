import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/app.dart';
import 'package:sipbilroid/blocs.dart';

void main() {
  Utils.initSystem();
  runApp(Blocs.blocsList( SipbilroidApp()));
}
