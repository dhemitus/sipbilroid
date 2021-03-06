import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/modules/modules.dart';

class Blocs {
  static MultiBlocProvider blocsList(Widget child) {
    return MultiBlocProvider(
      providers: [
        InitRoutes.bloc,
        OnBoardRoutes.bloc,
        AuthenticationRoutes.bloc,
        MainRoutes.bloc,
        VehicleRoutes.bloc,
        GasolineRoutes.bloc,
        HomeRoutes.bloc,
        ClaimRoutes.bloc,
        ClientRoutes.bloc,
        MapRoutes.bloc
      ], 
      child: child
    );
  }
}
