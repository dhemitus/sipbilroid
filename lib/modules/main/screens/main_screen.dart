import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: MainRoutes.key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(OntabList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.main != current.main,
      builder: (BuildContext context, MainState state) {
        print(state.main.list);
        return MainTemplate();
      }
    );
  }
}
