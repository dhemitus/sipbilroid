part of 'bloc.dart';

class VehicleState extends Equatable {
  final VehicleModel vehicle;
  final VehicleStatus status;
  final int index;

  VehicleState(this.vehicle, this.status, {this.index = 0});

  VehicleState copyWith({
    VehicleModel? vehicle,
    VehicleStatus? status,
    int? index
  }) => VehicleState(vehicle ?? this.vehicle, status ?? this.status, index: index ?? this.index);

  @override
  List<Object?> get props => [vehicle, status, index];
}
