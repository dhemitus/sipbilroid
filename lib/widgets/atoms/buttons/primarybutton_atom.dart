import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/shareds/shareds.dart';
class PrimaryButton extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool? enable;

  PrimaryButton({this.onTap, this.label, this.enable = true});

  _ontap(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enable! ? onTap!.call() : _ontap(),
      child: BaseContainer(
        color: Theme.of(context).colorScheme.default1Button,
        height: 35.0,
        radius: BorderRadius.circular(10),
        child: Heavy13Text(label ?? '', color: Theme.of(context).colorScheme.defaultTextButton),
        shadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 6,
            blurRadius: 9,
            offset: Offset(0, 6)
          )
        ],
      ),
    );
  }
}
