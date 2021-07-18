part of 'bloc.dart';

abstract class ClientEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnClientDetail extends ClientEvent {}
