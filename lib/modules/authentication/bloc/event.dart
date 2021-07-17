part of 'bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnLogin extends AuthenticationEvent {
  final AuthenticationModel auth;

  OnLogin(this.auth);

  @override
  List<AuthenticationModel> get props => [auth];
}

class OnLogout extends AuthenticationEvent {}
