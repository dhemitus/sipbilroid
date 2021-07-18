import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class CurrencyText extends StatelessWidget {
  final String? text;

  CurrencyText({this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: 'Rp.',
      style: Theme.of(context).textTheme.regular11.copyWith(color: Theme.of(context).colorScheme.tabOff),
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.top,
          child: Regular30Text(text ?? '', color: Theme.of(context).colorScheme.tabOff)
        )
      ]
    ));
  }
}
