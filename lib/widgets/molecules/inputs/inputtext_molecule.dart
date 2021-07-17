import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final Function? listener;
  final String? label, title, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark;
  final Widget? suffix, prefix;
  final int line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final InputBorder? border, focusBorder, disabledBorder;
  final List<Widget>? warning;

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
    this.inputType,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.border,
    this.focusBorder,
    this.disabledBorder,
    this.onTap,
    this.warning = const []
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Medium11Text(title ?? ''),
        BaseInput(
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
          border: border ?? UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.inputBorder
            )
          ),
          disabledBorder: border ?? UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.inputBorder
            )
          ),
          focusBorder: border ?? UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.inputBorder
            )
          ),
        ),
        Row(
          children: warning ?? <Widget>[],
        ),
        SizedBox(height: Dimension.smallSpace,)
      ],
    );
  }
}
