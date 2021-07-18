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
  late List<BottomNavigationBarItem> _tabs;
  late MainModel _data;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(OntabList());
  }

  void _onChange(int i) {
    BlocProvider.of<MainBloc>(context).add(OnTabIndex(_data.copyWith(index: i)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.main != current.main,
      builder: (BuildContext context, MainState state) {
        if(state.main.list != null && state.main.list!.isNotEmpty) {
          _tabs = [];
          _pages = [];
          _data = state.main;
          state.main.list!.map((MainModel _item) {
            _tabs.add(_item.item);
            _pages.add(_item.page!);
          }).toList();
          return MainTemplate(items: _tabs, index: state.main.index, onTap: _onChange, child: _pages[state.main.index!],);
        }
        return Container();

      }
    );
  }
}
