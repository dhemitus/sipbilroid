part of 'bloc.dart';

class VehicleState extends Equatable {
  final VehicleModel vehicle;
  final VehicleStatus status;

  VehicleState(this.vehicle, this.status);

  VehicleState copyWith({
    VehicleModel? vehicle,
    VehicleStatus? status
  }) => VehicleState(vehicle ?? this.vehicle, status ?? this.status);

  @override
  List<Object?> get props => [vehicle, status];
}
