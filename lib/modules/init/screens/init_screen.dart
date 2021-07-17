import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class InitScreen extends StatefulWidget {
  InitScreen({Key? key}) : super(key: InitRoutes.key);

  @override
  _InitScreenState createState() => _InitScreenState();
}
class _InitScreenState extends State<InitScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<InitBloc>(context).add(GetInit());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitBloc, InitState>(
      buildWhen: (previous, current) => previous.init != current.init,
      builder: (BuildContext context, InitState state) {
        print(state.init.init);
        return InitTemplate(
          child: Heavy13Text('init'),
        );
      }
    );
  }
}
