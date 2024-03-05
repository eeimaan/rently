import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomFileWidget extends StatelessWidget {
  final String fileName;

  final VoidCallback? onTap;

  const CustomFileWidget({Key? key, required this.fileName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mq.width * 0.6,
        height: 64,
        decoration: const ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            side: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: AppColors.turquoise,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: SvgPicture.asset(
                  AppImages.documentIcon,
                ),
              ),
              const CustomSize(
                width: 10,
              ),
              CustomText(
                label: fileName,
                size: FontSize.small,
                overflow: TextOverflow.ellipsis,
                weight: FontWeight.w500,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
