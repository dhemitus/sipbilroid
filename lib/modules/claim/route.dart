import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClaimRoutes {
  static const String claimPath = '/claim';
  static const String currentPath = '/current';
  static const String historyPath = '/history';
  static const Key claim = Key('__claimScreen__');
  static const Key current = Key('__currentScreen__');
  static const Key history = Key('__historyScreen__');
  static const Key detail = Key('__detailScreen__');

  static final BlocProvider bloc = BlocProvider<ClaimBloc>(
    create: (BuildContext context) => ClaimBloc(ClaimRepository())
  );
}
