import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class SettingsMenu extends StatelessWidget {
  final double width;
  final double height;
  final Icon icon;

  const SettingsMenu({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.033,
      width: width * 0.073,
      child: PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        icon: icon,
        onSelected: (value) {},
        itemBuilder: (BuildContext bc) {
          return [
            const PopupMenuItem(
              value: '/My Profile',
              child: CustomText(
                label: "My Profile",
                color: AppColors.black,
              ),
            ),
            const PopupMenuItem(
              value: '/Settings',
              child: CustomText(
                label: "Settings",
                color: AppColors.black,
              ),
            ),
            const PopupMenuItem(
              value: 'Get Help',
              child: CustomText(
                label: 'Get Help',
                color: AppColors.black,
              ),
            ),
          ];
        },
      ),
    );
  }
}
