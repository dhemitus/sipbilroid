import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/themes.dart';
import 'package:sipbilroid/routes.dart';
import 'package:sipbilroid/modules/modules.dart';

class SipbilroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Utils.initScreen(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIP BILROID',
      theme: Themes.lightMode,
      initialRoute: InitRoutes.path,
      routes: Routes.screens,
    ));
  }
}
