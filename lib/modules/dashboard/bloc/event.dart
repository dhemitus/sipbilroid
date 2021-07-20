part of 'bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnDashboardList extends DashboardEvent {
  final VehicleModel vehicle;

  OnDashboardList(this.vehicle);

  @override
  List<VehicleModel> get props => [vehicle];
}
