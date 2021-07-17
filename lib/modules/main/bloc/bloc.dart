import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _repo;

  MainBloc(MainRepository repo) : 
    _repo = repo,
    super(MainState(MainModel(), MainStatus.INIT));

  @override
  void onTransition(Transition<MainEvent, MainState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
  
    if(event is OntabList) {
      yield* _loadTabs();
    }

    if(event is OnTabIndex) {
      yield* _indexTab(event);
    }
  }

  Stream<MainState> _loadTabs() async* {
    yield this.state.copyWith(status: MainStatus.LOADING);

    MainModel _tabs = _repo.loadTabs();
    yield this.state.copyWith(main: _tabs, status: MainStatus.DONE);
  }

  Stream<MainState> _indexTab(OnTabIndex event) async* {
    yield this.state.copyWith(status: MainStatus.LOADING);

    MainModel _tabs = _repo.setIndex(event.index);
    yield this.state.copyWith(main: _tabs, status: MainStatus.DONE);
  }

}
