import 'package:flutter/material.dart';

class CustomSize extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CustomSize({super.key, this.height = 10, this.width = 10, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
