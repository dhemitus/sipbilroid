import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class LoginTemplate extends StatelessWidget {
  final TextEditingController? loginController, passwordController;
  final Function? onSubmit;

  LoginTemplate({this.onSubmit, this.passwordController, this.loginController});

  @override
  Widget build(BuildContext context) {
    return StackScaffold(
      children: <Widget>[
        LoginForm(loginController: loginController, passwordController: passwordController, onSubmit: onSubmit,)
      ],
    );
  }
}
