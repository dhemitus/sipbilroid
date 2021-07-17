import 'package:equatable/equatable.dart';

enum InitStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class InitModel extends Equatable {
  final String? init, message;
  static const onBoard = 'onboard screen';
  static const login = 'login screen';
  static const main = 'main screen';

  InitModel({this.message, this.init});

  @override
  List<Object?> get props => [init, message];

  InitModel copyWith({
    String? init,
    String? message
  }) => InitModel(
    init: init ?? this.init,
    message: message ?? this.message
  );
}
