part of 'bloc.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetMap extends MapEvent {
  final MapModel map;
  SetMap(this.map);

  @override
  List<MapModel> get props => [map];
}

class GetMap extends MapEvent {
  final MapModel map;
  GetMap(this.map);

  @override
  List<MapModel> get props => [map];
}
