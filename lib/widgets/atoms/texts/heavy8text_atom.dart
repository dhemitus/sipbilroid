import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class Heavy8Text extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  Heavy8Text(this.text, {
    Key? key,
    this.overflow,
    this.maxLines,
    this.align,
    this.color,
    this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: align,
    style: style?.copyWith(
      color: color ?? Theme.of(context).colorScheme.defaultText
    ) ?? Theme.of(context).textTheme.heavy8.copyWith(color: color ?? Theme.of(context).colorScheme.defaultText),
  );
}
