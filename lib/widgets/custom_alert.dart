import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomAlertDialog {
  static void show(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onGalleryPressed,
    required VoidCallback onCameraPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final mq = MediaQuery.of(context).size;
        return Theme(
          data: ThemeData(canvasColor: AppColors.white),
          child: AlertDialog(
            surfaceTintColor: Colors.white,
            title: Align(
              child: CustomText(
                label: title,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
            content: CustomText(
              label: content,
            ),
            actions: [
              CustomButton(
                width: mq.width,
                onPressed: onGalleryPressed,
                btnColor: AppColors.turquoise,
                borderColor: Colors.transparent,
                isChild: true,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    AppImages.galleryIcon,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 5,
                  ),
                  const CustomText(
                    label: 'Gallery',
                    size: FontSize.small,
                    weight: FontWeight.w600,
                    color: AppColors.white,
                  )
                ]),
              ),
              const CustomSize(
                height: 10,
              ),
              CustomButton(
                width: mq.width,
                onPressed: onCameraPressed,
                borderColor: AppColors.black,
                isChild: true,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    AppImages.camIcon,
                    colorFilter: const ColorFilter.mode(
                        AppColors.black, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 5,
                  ),
                  const CustomText(
                    label: 'Camera',
                    size: FontSize.small,
                    weight: FontWeight.w600,
                    color: AppColors.black,
                  )
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
