import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: HomeRoutes.key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      children: [
        VehicleScreen(),
        DashboardScreen()
      ],
    );
  }
}
