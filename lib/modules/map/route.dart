import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class MapRoutes {
  static const String path = '/map';
  static const Key key = Key('__mapScreen__');

  static final BlocProvider bloc = BlocProvider<MapBloc>(
    create: (BuildContext context) => MapBloc(MapRepository())
  );
}
