import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class ClaimBloc extends Bloc<ClaimEvent, ClaimState> {
  final ClaimRepository _repo;

  ClaimBloc(ClaimRepository repo) :
    _repo = repo,
    super(ClaimState(ClaimModel(), ClaimStatus.INIT));

  @override
  void onTransition(Transition<ClaimEvent, ClaimState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ClaimState> mapEventToState(ClaimEvent event) async* {
    if(event is OnClaimList) {
      yield* _loadList();
    }
  }

  Stream<ClaimState> _loadList() async* {
    yield this.state.copyWith(status: ClaimStatus.LOADING);

    ClaimModel _claim = await _repo.loadList();

    yield this.state.copyWith(claim: _claim, status: ClaimStatus.DONE);
  }
}
