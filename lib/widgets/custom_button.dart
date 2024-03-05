import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Widget? child;
  final double height;
  final double radius;
  final double width;
  final String? text;
  final bool isChild;
  final Function() onPressed;
  final Color? btnColor;
  final Color borderColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.borderRadius,
    this.isChild = false,
    this.text,
    this.textColor,
    this.borderColor = Colors.black,
    required this.onPressed,
    this.btnColor = Colors.white,
    this.child,
    required this.width,
    this.radius = 15,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: btnColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: isChild
          ? child
          : CustomText(
              label: '$text',
              color: textColor,
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
    );
  }
}
