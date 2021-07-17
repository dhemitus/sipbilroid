import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final Function? listener;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark;
  final Widget? suffix, prefix;
  final int line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final InputBorder? border, focusBorder, disabledBorder;

  BaseInput({
    this.listener,
    this.label,
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
    this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      cursorColor: Theme.of(context).colorScheme.inputCursor,
      controller: controller,
      maxLines: line,
      style: Theme.of(context).textTheme.overlineStyle
        .copyWith(color: Theme.of(context).colorScheme.inputStyle),
      obscureText: password,
      enabled: enable,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      textInputAction: inputAction,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.transparent,
        filled: true,
        contentPadding: EdgeInsets.all(0.0),
        labelText: label,
        labelStyle: Theme.of(context).textTheme.overlineStyle
          .copyWith(color: Theme.of(context).colorScheme.inputLabel),
        hintStyle: Theme.of(context).textTheme.overlineStyle
          .copyWith(color: Theme.of(context).colorScheme.inputHint),
        enabledBorder: border,
        disabledBorder: disabledBorder,
        focusedBorder: focusBorder,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hint,
        errorText: error,
      ),
    );
  }
}
