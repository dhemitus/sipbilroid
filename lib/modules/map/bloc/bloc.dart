import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _repo;

  MapBloc(MapRepository repo) :
    _repo = repo,
    super(MapState(MapModel(), MapStatus.INIT));

  @override
  void onTransition(Transition<MapEvent, MapState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if(event is SetMap) {
      yield* _setMap(event);
    }

    if(event is GetMap) {
      yield* _getMap(event);
    }
  }

  Stream<MapState> _setMap(SetMap event) async* {
    yield this.state.copyWith(status: MapStatus.LOADING);

    MapModel _map = await _repo.setLocation(event.map);
    yield this.state.copyWith(map: _map, status: MapStatus.DONE);
  }

  Stream<MapState> _getMap(GetMap event) async* {
    yield this.state.copyWith(status: MapStatus.LOADING);

    MapModel _map = await _repo.getLocation(event.map);
    yield this.state.copyWith(map: _map, status: MapStatus.DONE);
  }

}
