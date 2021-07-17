part of 'bloc.dart';

class InitState extends Equatable {
  final InitModel init;
  final InitStatus status;

  InitState(this.init, this.status);

  InitState copyWith({
    InitModel? init,
    InitStatus? status
  }) => InitState(init ?? this.init, status ?? this.status);

  @override
  List<Object?> get props => [init, status];
}
