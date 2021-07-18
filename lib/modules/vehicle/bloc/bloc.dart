import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipbilroid/modules/modules.dart';

part 'event.dart';
part 'state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository _repo;

  VehicleBloc(VehicleRepository repo) :
    _repo = repo,
    super(VehicleState(VehicleModel(), VehicleStatus.INIT));

  @override
  void onTransition(Transition<VehicleEvent, VehicleState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<VehicleState> mapEventToState(VehicleEvent event) async* {
    if(event is OnVehicleList) {
      yield* _loadVehicles();
    }
  }

  Stream<VehicleState> _loadVehicles() async* {
    yield this.state.copyWith(status: VehicleStatus.LOADING);

    VehicleModel _vehicle = await _repo.loadVehcles();
    yield this.state.copyWith(vehicle: _vehicle, status: VehicleStatus.DONE);
  }
}
