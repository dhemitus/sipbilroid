import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/modules/modules.dart';

class Routes {
  static final Map<String, WidgetBuilder> screens = {
    InitRoutes.path: (BuildContext context) => InitScreen(),
    OnBoardRoutes.path: (BuildContext context) => OnBoardScreen(),
    AuthenticationRoutes.path: (BuildContext context) => LoginScreen()
  };
}
