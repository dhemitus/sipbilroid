import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class GasolineBloc extends Bloc<GasolineEvent, GasolineState> {
  final GasolineRepository _repo;

  GasolineBloc(GasolineRepository repo) :
    _repo = repo,
    super(GasolineState(GasolineModel(), GasolineStatus.INIT));

  @override
  void onTransition(Transition<GasolineEvent, GasolineState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<GasolineState> mapEventToState(GasolineEvent event) async* {
    if(event is OnGasolineList) {
      yield* _loadGasolines();
    }
  }

  Stream<GasolineState> _loadGasolines() async* {
    yield this.state.copyWith(status: GasolineStatus.LOADING);

    GasolineModel _gasolie = await _repo.loadGasolines();
    yield this.state.copyWith(gasoline: _gasolie, status: GasolineStatus.DONE);
  }
}
