import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
;
class LoginTemplate extends StatelessWidget {
  final TextEditingController? loginController, passwordController;
  final Function? onSubmit;

  LoginTemplate({this.onSubmit, this.passwordController, this.loginController});

  @override
  Widget build(BuildContext context) {
    return StackScaffold(
      bottomExtension: 0,
      background: BaseContainer(
        image: ImageUtils.imageAsset('assets/images/background.png', fit: BoxFit.cover),
      ),
      children: <Widget>[
        SizedBox(height: 130.0.w,),
        LogoContainer(small: false,),
        SizedBox(height: 6.0.w,),
        Regular10Text('BALAI BESAR MKG WILAYAH II'),
        SizedBox(height: 56.0.w,),
        BaseContainer(
          height: 37.0.w,
          image: ImageUtils.imageAsset('assets/images/title.png', fit: BoxFit.contain),
        ),
        BaseContainer(
          width: 230.0.w,
          child: Regular10Text('SISTEM INFORMASI PENGENDALIAN BBM BERBASIS MOBILE ANDROID', align: TextAlign.center,),
        ),
        SizedBox(height: 34.0.w,),
        LoginForm(loginController: loginController, passwordController: passwordController, onSubmit: onSubmit,)
      ],
    );
  }
}
