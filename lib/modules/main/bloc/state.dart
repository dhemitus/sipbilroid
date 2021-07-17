part of 'bloc.dart';

class MainState extends Equatable {
  final MainModel main;
  final MainStatus status;

  MainState(this.main, this.status);

  MainState copyWith({
    MainModel? main,
    MainStatus? status
  }) => MainState(main ?? this.main, status ?? this.status);

  @override
  List<Object?> get props => [main, status];
}
