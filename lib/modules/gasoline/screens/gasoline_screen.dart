import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class GasolineScreen extends StatefulWidget {
  @override
  _GasolineScreenState createState() => _GasolineScreenState();
}

class _GasolineScreenState extends State<GasolineScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GasolineBloc>(context).add(OnGasolineList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GasolineBloc, GasolineState>(
      buildWhen: (previous, current) => previous.gasoline != current.gasoline,
      builder: (BuildContext context, GasolineState state) {
        print(state.gasoline.list);
        return Container();
      }
    );
  }

}
