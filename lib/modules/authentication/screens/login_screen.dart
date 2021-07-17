import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: AuthenticationRoutes.key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _onSubmit() {
    AuthenticationModel _auth = AuthenticationModel(phone: _loginController.text, password: _passwordController.text);
    BlocProvider.of<AuthenticationBloc>(context).add(OnLogin(_auth));
    print(_auth.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) => previous.auth != current.auth,
      builder: (BuildContext context, AuthenticationState state) {
        if(state.status == AuthenticationStatus.DONE) {
          WidgetsBinding.instance!.addPostFrameCallback((_) { 
            print('runn');
            BlocProvider.of<InitBloc>(context).add(SetInit(InitModel(init: InitModel.main)));
            Navigator.of(context).popAndPushNamed(MainRoutes.path);
          });
        }
        return LoginTemplate(loginController: _loginController, passwordController: _passwordController, onSubmit: _onSubmit,);
      }
    );
  }
}
