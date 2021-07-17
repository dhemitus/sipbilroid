import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class MainRoutes {
  static const String path = '/main';
  static const Key key = Key('__mainScreen__');

  static final BlocProvider bloc = BlocProvider<MainBloc>(
    create: (BuildContext context) => MainBloc(MainRepository())
  );
}
