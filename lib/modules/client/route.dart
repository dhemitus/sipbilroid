import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClientRoutes {
  static const String path = '/client';
  static const Key key = Key('__clientScreen__');

  static final BlocProvider bloc = BlocProvider<ClientBloc>(
    create: (BuildContext context) => ClientBloc(ClientRepository())
  );
}
