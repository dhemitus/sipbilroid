part of 'bloc.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OntabList extends MainEvent {}

class OnTabIndex extends MainEvent {
  final MainModel index;
  OnTabIndex(this.index);

  @override
  List<MainModel> get props => [index];
}
