part of 'bloc.dart';

class DashboardState extends Equatable {
  final DashboardModel dashboard;
  final DashboardStatus status;

  DashboardState(this.dashboard, this.status);

  DashboardState copyWith({
    DashboardModel? dashboard,
    DashboardStatus? status
  }) => DashboardState(dashboard ?? this.dashboard, status ?? this.status);

  @override
  List<Object?> get props => [dashboard, status];
}
