part of 'bloc.dart';

class GasolineState extends Equatable {
  final GasolineModel gasoline;
  final GasolineStatus status;

  GasolineState(this.gasoline, this.status);

  GasolineState copyWith({
    GasolineModel? gasoline,
    GasolineStatus? status
  }) => GasolineState(gasoline ?? this.gasoline, status ?? this.status);

  @override
  List<Object?> get props => [gasoline, status];
}
