part of 'bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationModel auth;
  final AuthenticationStatus status;

  AuthenticationState(this.auth, this.status);

  AuthenticationState copyWith({
    AuthenticationModel? auth,
    AuthenticationStatus? status
  }) => AuthenticationState(auth ?? this.auth, status ?? this.status);

  @override
  List<Object?> get props => [auth, status];
}
