import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repo;

  AuthenticationBloc(AuthenticationRepository repo) :
    _repo = repo,
    super(AuthenticationState(AuthenticationModel(), AuthenticationStatus.INIT));

  @override
  void onTransition(Transition<AuthenticationEvent, AuthenticationState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if(event is OnLogin) {
      yield* _onLogin(event);
    }
  }

  Stream<AuthenticationState> _onLogin(OnLogin event) async* {
    yield this.state.copyWith(status: AuthenticationStatus.LOADING);

    AuthenticationModel _auth = await _repo.login(event.auth);
    yield this.state.copyWith(auth: _auth, status: AuthenticationStatus.DONE);
  }
}
