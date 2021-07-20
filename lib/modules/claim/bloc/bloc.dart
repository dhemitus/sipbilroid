import 'dart:math';

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
      yield* _loadList(event);
    }

    if(event is OnClaimPeriod) {
      yield* _loadPeriod(event);
    }

    if(event is OnClaimPost) {
      yield* _postClaim(event);
    }

  }

  Stream<ClaimState> _postClaim(OnClaimPost event) async* {
    yield this.state.copyWith(status: ClaimStatus.LOADING);
    ClaimModel _claim = await _repo.sendClaim(event.claim);

    yield this.state.copyWith(claim:_claim, status: ClaimStatus.DONE);
  }

  Stream<ClaimState> _loadList(OnClaimList event) async* {
    yield this.state.copyWith(status: ClaimStatus.LOADING);

    ClaimModel _claim = await _repo.loadList(event.vehicle);

    yield this.state.copyWith(claim: _claim, status: ClaimStatus.DONE);
  }

  Stream<ClaimState> _loadPeriod(OnClaimPeriod event) async* {
    yield this.state.copyWith(status: ClaimStatus.LOADING);

    ClaimModel _claim = await _repo.loadPeriod(event.period);

    yield this.state.copyWith(claim: _claim, status: ClaimStatus.DONE);
  }
}
