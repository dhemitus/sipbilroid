import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController? loginController, passwordController;
  final Function? onSubmit;

  LoginForm({this.passwordController, this.loginController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.symmetric(horizontal: 48.0.w),
      child: Column(
        children: <Widget>[
          InputText(hint: 'No Handphone', controller: loginController,),
          InputText(hint: 'Password', controller: passwordController, password: true,),
          SizedBox(height: 82.0.w,),
          PrimaryButton(label: 'Login', onTap: onSubmit,)
        ],
      )
    );
  }
}
