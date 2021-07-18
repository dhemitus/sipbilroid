part of 'bloc.dart';

class ClientState extends Equatable {
  final ClientModel client;
  final ClientStatus status;

  ClientState(this.client, this.status);

  ClientState copyWith({
    ClientModel? client,
    ClientStatus? status
  }) => ClientState(client ?? this.client, status ?? this.status);

  @override
  List<Object?> get props => [client, status];
}
