import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class AuthenticationRoutes {
  static const String path = '/login';
  static const Key key = Key('__loginScreen__');

  static final BlocProvider bloc = BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) => AuthenticationBloc(AuthenticationRepository())
  );
}
