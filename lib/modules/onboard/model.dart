import 'package:equatable/equatable.dart';

enum OnBoardStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class OnBoardModel extends Equatable {
  final String? title, subtitle, image, message;
  final List<OnBoardModel>? list;

  OnBoardModel({this.image, this.subtitle, this.title, this.message, this.list});

  @override
  List<Object?> get props => [image, subtitle, title, message, list];

  OnBoardModel copyWith({
    String? image,
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
