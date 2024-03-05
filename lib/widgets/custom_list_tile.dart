import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? tileColor;
  final EdgeInsetsGeometry? contentPadding;

  const CustomListTile({
    Key? key,
    this.leading,
    required this.title,
    this.onTap,
    this.contentPadding = EdgeInsets.zero,
    this.trailing,
    this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19515BD4),
            blurRadius: 40,
            offset: Offset(2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListTile(
          tileColor: tileColor,
          contentPadding: contentPadding,
          leading: leading,
          title: title,
          onTap: onTap,
          trailing: trailing,
        ),
      ),
    );
  }
}
