part of 'bloc.dart';

abstract class GasolineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnGasolineList extends GasolineEvent {}
