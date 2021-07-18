import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository _repo;

  ClientBloc(ClientRepository repo) :
    _repo = repo,
    super(ClientState(ClientModel(), ClientStatus.INIT));

  @override
  void onTransition(Transition<ClientEvent, ClientState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ClientState> mapEventToState(ClientEvent event) async* {
    if(event is OnClientDetail) {
      yield* _loadClient();
    }
  }

  Stream<ClientState> _loadClient() async* {
    yield this.state.copyWith(status: ClientStatus.LOADING);

    ClientModel _client = await _repo.loadClient();
    yield this.state.copyWith(client: _client, status: ClientStatus.DONE);
  }
}
