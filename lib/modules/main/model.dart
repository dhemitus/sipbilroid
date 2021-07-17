import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum MainStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

List<MainModel> tabsList = [
  MainModel(label: 'Home', activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined)),
  MainModel(label: 'Current Month', activeIcon: Icon(Icons.book), icon: Icon(Icons.book_outlined)),
  MainModel(label: '', activeIcon: Icon(Icons.add_box), icon: Icon(Icons.add_box)),
  MainModel(label: 'History', activeIcon: Icon(Icons.history), icon: Icon(Icons.history_outlined)),
  MainModel(label: 'User', activeIcon: Icon(Icons.people), icon: Icon(Icons.people_outlined)),
];

class MainModel extends Equatable {
  final Widget? activeIcon, icon, page;
  final String? label, message;
  final List<MainModel>? list;
  final int? index;

  MainModel({this.label, this.page, this.icon, this.activeIcon, this.message, this.list, this.index = 0});

  BottomNavigationBarItem get item => BottomNavigationBarItem(icon: icon!, activeIcon: activeIcon!, label: label);

  @override
  List<Object?> get props => [activeIcon, icon, page, label, message, list, index];

  MainModel copyWith({
    String? label,
    String? message,
    Widget? activeIcon,
    Widget? icon,
    Widget? page,
    List<MainModel>? list,
    int? index
  }) => MainModel(
    label: label ?? this.label,
    message: message ?? this.message,
    activeIcon: activeIcon ?? this.activeIcon,
    icon: icon ?? this.icon,
    page: page ?? this.page,
    list: list ?? this.list,
    index: index ?? this.index
  );
}
