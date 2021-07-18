part of 'bloc.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnVehicleList extends VehicleEvent {}
