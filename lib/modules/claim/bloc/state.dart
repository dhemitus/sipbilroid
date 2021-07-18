part of 'bloc.dart';

class ClaimState extends Equatable {
  final ClaimModel claim;
  final ClaimStatus status;

  ClaimState(this.claim, this.status);

  ClaimState copyWith({
    ClaimModel? claim,
    ClaimStatus? status
  }) => ClaimState(claim ?? this.claim, status ?? this.status);

  @override
  List<Object?> get props => [claim, status];
}
