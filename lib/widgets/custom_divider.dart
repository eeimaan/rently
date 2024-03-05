import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? thickness;
  final double? endIndent;
  final double? indent;

  const CustomDivider(
      {super.key,
      this.color,
      this.width,
      this.height,
      this.endIndent,
      this.indent,
      this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
      endIndent: endIndent,
      indent: indent,
      thickness: thickness,
    );
  }
}
