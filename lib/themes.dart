import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Themes {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}
