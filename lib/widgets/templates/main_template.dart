import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class MainTemplate extends StatelessWidget {
  final Widget? child;
  final Function(int)? onTap;
  final List<BottomNavigationBarItem>? items;
  final int? index;

  MainTemplate({this.child, this.items, this.onTap, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      child: child ?? Container(),
      tabBar: BottomNavigationBar(
        onTap: onTap,
        items: items!,
        currentIndex: index!,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.tabOff,
        selectedItemColor: Theme.of(context).colorScheme.tabOn,
        backgroundColor: Theme.of(context).colorScheme.defaultBackground,
        selectedLabelStyle: Theme.of(context).textTheme.regular8,
        unselectedLabelStyle: Theme.of(context).textTheme.regular8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
