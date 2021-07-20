part of 'bloc.dart';

class MapState extends Equatable {
  final MapModel map;
  final MapStatus status;

  MapState(this.map, this.status);

  MapState copyWith({
    MapModel? map,
    MapStatus? status
  }) => MapState(map ?? this.map, status ?? this.status);

  @override
  List<Object?> get props => [map, status];
}
