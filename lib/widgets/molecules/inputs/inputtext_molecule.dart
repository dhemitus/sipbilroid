import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipbilroid/shareds/shareds.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputText extends StatelessWidget {
  final Function? listener;
  final String? label, title, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark, solid;
  final Widget? suffix, prefix;
  final int line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final InputBorder? border, focusBorder, disabledBorder;
  final List<Widget>? warning;
  final Color? fill;

  InputText({
    this.listener,
    this.label,
    this.title,
    this.hint,
    this.value,
    this.error,
    this.controller,
    this.line = 1,
    this.suffix,
    this.prefix,
    this.password = false,
    this.enable = true,
    this.dark = false,
    this.solid = false,
    this.inputType,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.border,
    this.focusBorder,
    this.disabledBorder,
    this.fill,
    this.onTap,
    this.warning = const []
  });

  @override
  Widget build(BuildContext context) {
    return title != null ?
      _withTitle(fill ?? Theme.of(context).colorScheme.inputBackground.withOpacity(solid ? 1 : .2), Theme.of(context).colorScheme.inputLabel, Theme.of(context).colorScheme.noColor)
      :
      _withoutTitle(fill ?? Theme.of(context).colorScheme.inputBackground.withOpacity(solid ? 1 : .2));
  }

  Widget _withTitle(Color c, Color l, Color b) {
    return BaseContainer(
      radius: BorderRadius.circular(8.0.w),
      margin: EdgeInsets.only(bottom: 12.0.w),
      padding: EdgeInsets.only(left: 14.0.w, right: 14.0.w, top: 8.0.w, bottom: 14.0.w),
      color: c,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Regular9Text(title ?? '', color: l),
          _inputField(b),
          Row(
            children: warning ?? <Widget>[],
          ),
        ]
      )
    );
  }

  Widget _withoutTitle(Color c) {
    return BaseContainer(
      margin: EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _inputField(c),
          Row(
            children: warning ?? <Widget>[],
          ),
        ],
      )
    );
  }

  Widget _inputField(Color c) {
    return BaseInput(
      value: value,
      line: line,
      listener: listener,
      label: label,
      hint: hint,
      error: error,
      controller: controller,
      suffix: suffix,
      prefix: prefix,
      password: password,
      enable: enable,
      dark: dark,
      inputType: inputType,
      onTap: onTap,
      onChange: onChange,
      onSubmit: onSubmit,
      inputAction: inputAction,
      padding: title != null ? EdgeInsets.all(0) : EdgeInsets.all(14.0.w),
      fill: c,
      border: border ?? OutlineInputBorder(
        borderSide: BorderSide(
          color: c
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      disabledBorder: border ?? OutlineInputBorder(
        borderSide: BorderSide(
          color: c
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      focusBorder: border ?? OutlineInputBorder(
        borderSide: BorderSide(
          color: c
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
    );
  }
}
