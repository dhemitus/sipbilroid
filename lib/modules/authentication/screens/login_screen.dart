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
    print(_auth.toLogin());
  }

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(loginController: _loginController, passwordController: _passwordController, onSubmit: _onSubmit,);
  }
}
