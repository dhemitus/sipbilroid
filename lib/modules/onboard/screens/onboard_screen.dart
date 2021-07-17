import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({Key? key}) : super(key: OnBoardRoutes.key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnBoardBloc>(context).add(OnBoardList());
  }

  void _onNext() {
    BlocProvider.of<InitBloc>(context).add(SetInit(InitModel(init: InitModel.login)));
    Navigator.of(context).pushReplacementNamed(AuthenticationRoutes.path);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardBloc, OnBoardState>(
      buildWhen: (previous, current) => previous.onboard != current.onboard,
      builder: (BuildContext context, OnBoardState state) {
        print(state.onboard.list);
        return StackScaffold(
          children: [
            BaseContainer(
              alignment: Alignment.center,
            ),
            SizedBox(height: 150,),
            PrimaryButton(label: 'next', onTap: _onNext,)
          ]
        );
      }
    );
  }
}
