import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/atoms/atoms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OnBoardStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

List<OnBoardModel> onBoards = [
  OnBoardModel(
    image: BaseContainer(
      width: 200.w,
      height: 300.w,
      image: ImageUtils.imageAsset('assets/images/onboard1.png', fit: BoxFit.contain),
    ),
    title: 'on board 1'
  ),
  OnBoardModel(
    image: BaseContainer(
      width: 200.w,
      height: 300.w,
      image: ImageUtils.imageAsset('assets/images/onboard2.png', fit: BoxFit.contain),
    ),
    title: 'on board 2'
  ),
  OnBoardModel(
    image: BaseContainer(
      width: 200.w,
      height: 300.w,
      image: ImageUtils.imageAsset('assets/images/onboard3.png', fit: BoxFit.contain),
    ),
    title: 'on board 3'
  ),
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
