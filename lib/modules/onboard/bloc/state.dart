part of 'bloc.dart';

class OnBoardState extends Equatable {
  final OnBoardModel onboard;
  final OnBoardStatus status;

  OnBoardState(
    this.onboard,
    this.status
  );

  OnBoardState copyWith({
    OnBoardModel? onboard,
    OnBoardStatus? status
  }) => OnBoardState(
    onboard ?? this.onboard,
    status ?? this.status
  );

  @override
  List<Object?> get props => [onboard, status];
}
