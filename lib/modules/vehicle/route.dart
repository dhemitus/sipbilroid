import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class VehicleRoutes {
  static const String path = '/vehicle';
  static const Key key = Key('__vehicleScreen__');

  static final BlocProvider bloc = BlocProvider<VehicleBloc>(
    create: (BuildContext context) => VehicleBloc(VehicleRepository())
  );
}
