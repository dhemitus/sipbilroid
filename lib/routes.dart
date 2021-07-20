import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/modules/modules.dart';

class Routes {
  static final Map<String, WidgetBuilder> screens = {
    InitRoutes.path: (BuildContext context) => InitScreen(),
    OnBoardRoutes.path: (BuildContext context) => OnBoardScreen(),
    AuthenticationRoutes.path: (BuildContext context) => LoginScreen(),
    MainRoutes.path: (BuildContext context) => MainScreen(),
    ClaimRoutes.claimPath: (BuildContext context) => ClaimScreen(),
    ClaimRoutes.currentPath: (BuildContext context) => CurrentScreen(),
    ClaimRoutes.historyPath: (BuildContext context) => HistoryScreen(),
    ClaimRoutes.detailPath: (BuildContext context) => DetailScreen(),
    HomeRoutes.path: (BuildContext context) => HomeScreen(),
    MapRoutes.path: (BuildContext context) => MapScreen()
  };
}
