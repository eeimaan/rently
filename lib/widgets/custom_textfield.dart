import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isBorder;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final bool isVisibleText;
  final double height;
  final Color fillColor;
  final Color? hintColor;
  final double? width;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;
  final IconData? iconData;
  final int maxLines;
  final TextInputType? keyboardType;
  final FormValidator? validator;
  final bool readOnly;
  final Color borderColor;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    this.iconData,
    this.isBorder = false,
    this.controller,
    this.height = 56,
    this.textInputFormatter,
    this.suffixStyle,
    required this.hintText,
    required this.fillColor,
    this.isVisibleText = false,
    this.readOnly = false,
    this.hintStyle,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.width,
    this.borderColor = AppColors.black,
    this.borderRadius = 20,
    this.hintColor = AppColors.grey,
  });

  @override
  build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        cursorColor: AppColors.turquoise,
        inputFormatters: textInputFormatter,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: isVisibleText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: FontSize.small,
            fontWeight: FontWeight.w500,
          ),
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          suffixStyle: suffixStyle,
          prefixIconColor: AppColors.teal,
          prefixIcon: iconData != null ? Icon(iconData) : null,
          contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String input) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(input);
}

bool isValidInput(String input) {
  final inputRegex = RegExp(r'^[0-9-]+$');
  return inputRegex.hasMatch(input);
}

bool isValidAddress(String input) {
  final addressRegex = RegExp(r'^[a-zA-Z0-9\s\-#,./]+$');
  return addressRegex.hasMatch(input);
}
