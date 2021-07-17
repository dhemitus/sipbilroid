import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class OnBoardRoutes {
  static const String path = '/onboard';
  static const Key key = Key('__onBoardScreen__');

  static final BlocProvider bloc = BlocProvider<OnBoardBloc>(
    create: (BuildContext context) => OnBoardBloc(OnBoardRepository())
  );
}
