import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

enum OnBoardStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

List<OnBoardModel> onBoards = [
  OnBoardModel(image: SVGS.onboard1, title: 'on board 1'),
  OnBoardModel(image: SVGS.onboard2, title: 'on board 2'),
  OnBoardModel(image: SVGS.onboard3, title: 'on board 3'),
];

class OnBoardModel extends Equatable {
  final String? title, subtitle, message;
  final List<OnBoardModel>? list;
  final Widget? image;

  OnBoardModel({this.image, this.subtitle, this.title, this.message, this.list});

  @override
  List<Object?> get props => [image, subtitle, title, message, list];

  OnBoardModel copyWith({
    Widget? image,
    String? subtitle,
    String? title,
    String? message,
    List<OnBoardModel>? list
  }) => OnBoardModel(
    image: image ?? this.image,
    subtitle: subtitle ?? this.subtitle,
    title: title ?? this.title,
    message: message ?? this.message,
    list: list ?? this.list
  );
}
