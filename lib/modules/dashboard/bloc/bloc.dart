import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repo;

  DashboardBloc(DashboardRepository repo) :
    _repo = repo,
    super(DashboardState(DashboardModel(), DashboardStatus.INIT));

  @override
  void onTransition(Transition<DashboardEvent, DashboardState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if(event is OnDashboardList) {
      yield* _loadDashboard();
    }
  }

  Stream<DashboardState> _loadDashboard() async* {
    yield this.state.copyWith(status: DashboardStatus.LOADING);

    DashboardModel _dashboard = await _repo.loadDashboard();
    yield this.state.copyWith(dashboard: _dashboard, status: DashboardStatus.DONE);
  }
}
