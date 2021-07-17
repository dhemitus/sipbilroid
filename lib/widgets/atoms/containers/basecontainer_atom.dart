import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final BorderRadius? radius;
  final Border? border;
  final double? width, height;
  final EdgeInsets? padding, margin;
  final Alignment alignment;
  final List<BoxShadow>? shadow;
  final LinearGradient? gradient;
  final DecorationImage? image;
  final BoxShape? shape;

  BaseContainer({
    this.alignment = Alignment.center,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.child,
    this.color,
    this.image,
    this.gradient,
    this.radius,
    this.shadow,
    this.border,
    this.shape
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width != null ? width : null,
      height: height != null ? height : null,
      alignment: alignment,
      child: child,
      decoration: BoxDecoration(
        image: image,
        gradient: gradient,
        border: border,
        color: color,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: radius,
        boxShadow: shadow
      ),
    );
  }
}
