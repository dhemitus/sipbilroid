import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class GasolineRoutes {
  static const String path = '/gasoline';
  static const Key key = Key('__gasolineScreen__');

  static final BlocProvider bloc = BlocProvider<GasolineBloc>(
    create: (BuildContext context) => GasolineBloc(GasolineRepository())
  );
}
