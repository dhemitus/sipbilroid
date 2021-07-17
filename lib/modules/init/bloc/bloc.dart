import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final InitRepository _repo;

  InitBloc(InitRepository repo) :
    _repo = repo,
    super(InitState(InitModel(), InitStatus.INIT));

  @override
  void onTransition(Transition<InitEvent, InitState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    if(event is SetInit) {
      yield* _setInit(event);
    }

    if(event is GetInit) {
      yield* _getInit();
    }
  }

  Stream<InitState> _setInit(SetInit event) async* {
    yield this.state.copyWith(status: InitStatus.LOADING);

    InitModel _init = await _repo.setInit(event.init);
    yield this.state.copyWith(init: _init, status: InitStatus.DONE);
  }

  Stream<InitState> _getInit() async* {
    yield this.state.copyWith(status: InitStatus.LOADING);

    InitModel _init = await _repo.getInit();
    yield this.state.copyWith(init: _init, status: InitStatus.DONE);
  }
}
