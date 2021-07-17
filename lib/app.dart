import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/themes.dart';
import 'package:sipbilroid/modules/modules.dart';

class SipbilroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Utils.initScreen(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.lightMode,
      home: InitScreen(),
    ));
  }
}
