import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: HomeRoutes.key);

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      children: [
        HeaderScreen(title: 'DASHBOARD',),
        VehicleScreen(),
        DashboardScreen()
      ],
    );
  }
}
