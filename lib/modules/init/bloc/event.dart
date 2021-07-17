part of 'bloc.dart';

abstract class InitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetInit extends InitEvent {
  final InitModel init;
  SetInit(this.init);

  @override
  List<InitModel> get props => [init];
}

class GetInit extends InitEvent {}
