import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  final OnBoardRepository _repo;

  OnBoardBloc(OnBoardRepository repo) :
    _repo = repo,
    super(OnBoardState(OnBoardModel(), OnBoardStatus.INIT));

  @override
  void onTransition(Transition<OnBoardEvent, OnBoardState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<OnBoardState> mapEventToState(OnBoardEvent event) async* {
    if(event is OnBoardList) {
      yield* _loadOnBoards(event);
    }
  }

  Stream<OnBoardState> _loadOnBoards(OnBoardList event) async* {
    yield this.state.copyWith(status: OnBoardStatus.LOADING);

    OnBoardModel _onboard = _repo.loadOnBoards();
    yield this.state.copyWith(onboard: _onboard, status: OnBoardStatus.DONE);
  }
}
