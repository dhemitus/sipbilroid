import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController? loginController, passwordController;
  final Function? onSubmit;

  LoginForm({this.passwordController, this.loginController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 130,),
        InputText(title: 'Login', hint: 'No Handphone', controller: loginController,),
        InputText(title: 'Password', hint: '...', controller: passwordController, password: true,),
        PrimaryButton(label: 'Login', onTap: onSubmit,)
      ],
    );
  }
}
