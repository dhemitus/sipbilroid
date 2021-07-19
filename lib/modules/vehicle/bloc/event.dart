part of 'bloc.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnVehicleList extends VehicleEvent {}

class OnVehicleSlide extends VehicleEvent {
  final int index;
  OnVehicleSlide(this.index);

  @override
  List<int> get props => [index];
}
