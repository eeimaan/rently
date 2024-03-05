import 'package:flutter/material.dart';

class ShapeContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Decoration? decoration;

  const ShapeContainer(
      {super.key, this.height, this.width, this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: child,
    );
  }
}
