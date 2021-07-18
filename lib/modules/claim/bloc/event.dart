part of 'bloc.dart';

abstract class ClaimEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnClaimList extends ClaimEvent {}

class OnClaimPeriod extends ClaimEvent {
  final String period;
  OnClaimPeriod(this.period);
  @override
  List<String> get props => [period];
}

class OnClaimDetail extends ClaimEvent {
  final String id;
  OnClaimDetail(this.id);
  @override
  List<String> get props => [id];
}
