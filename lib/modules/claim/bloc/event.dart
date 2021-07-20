part of 'bloc.dart';

abstract class ClaimEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnClaimList extends ClaimEvent {
  final VehicleModel vehicle;
  OnClaimList(this.vehicle);

  @override
  List<VehicleModel> get props => [vehicle];
}

class OnClaimPeriod extends ClaimEvent {
  final String period;
  OnClaimPeriod(this.period);
  @override
  List<String> get props => [period];
}

class OnClaimDetail extends ClaimEvent {
  final ClaimModel claim;
  OnClaimDetail(this.claim);
  @override
  List<ClaimModel> get props => [claim];
}

class OnClaimPost extends ClaimEvent {
  final Map<String, dynamic> claim;

  OnClaimPost(this.claim);

  @override
  List<Map<String, dynamic>> get props => [claim];
}
