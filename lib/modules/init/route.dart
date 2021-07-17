import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class InitRoutes {
  static const String path = '/';
  static const Key key = Key('__initScreen__');

  static final BlocProvider bloc = BlocProvider<InitBloc>(
    create: (BuildContext context) => InitBloc(InitRepository())
  );
}
