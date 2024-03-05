import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CreateAccountAddPic extends StatelessWidget {
  const CreateAccountAddPic({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.turquoise,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  AppImages.splashLogo,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  label: 'Create your account',
                  color: Colors.black,
                  size: FontSize.large,
                  weight: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      label: 'Please enter your details',
                      color: AppColors.black,
                      size: 11,
                      weight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.home);
                      },
                      child: const CustomText(
                        label: 'Skip For Now',
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                        size: 11,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const CustomSize(
                  height: 10,
                ),
                const CustomText(
                  label: 'Upload Your Profile Picture',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w800,
                ),
                const CustomSize(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      CustomAlertDialog.show(
                        context,
                        title: 'Choose an Option',
                        content:
                            'Select one of the following from where you want to upload image',
                        onCameraPressed: () {},
                        onGalleryPressed: () {},
                      );
                    },
                    child: Container(
                      width: mq.width * 0.4,
                      height: mq.width * 0.4,
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.turquoise,
                        ),
                      ),
                    ),
                  ),
                ),
                const CustomSize(
                  height: 15,
                ),
                const CustomText(
                  label: 'ID Verification',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w800,
                ),
                const CustomSize(
                  height: 5,
                ),
                const CustomText(
                  label:
                      'Add front & back image of your ID Card and also a selfie of yourself with front of ID Card.',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 20,
                ),
                CustomFileWidget(
                    fileName: 'Filename.docs',
                    onTap: () {
                      CustomAlertDialog.show(
                        context,
                        title: 'Choose an Option',
                        content:
                            'Select one of the following from where you want to upload',
                        onCameraPressed: () {},
                        onGalleryPressed: () {},
                      );
                    }),
                const CustomSize(
                  height: 10,
                ),
                CustomFileWidget(
                    fileName: 'Filename.docs',
                    onTap: () {
                      CustomAlertDialog.show(
                        context,
                        title: 'Choose an Option',
                        content:
                            'Select one of the following from where you want to upload',
                        onCameraPressed: () {},
                        onGalleryPressed: () {},
                      );
                    }),
                const CustomSize(
                  height: 15,
                ),
                const CustomText(
                  label: 'Bank statement and Payslip Verification',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w800,
                ),
                const CustomSize(
                  height: 5,
                ),
                const CustomText(
                  label:
                      'Add images of bank statement and payslip\nfor verification.',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 20,
                ),
                CustomFileWidget(
                    fileName: 'Filename.docs',
                    onTap: () {
                      CustomAlertDialog.show(
                        context,
                        title: 'Choose an Option',
                        content:
                            'Select one of the following from where you want to upload ',
                        onCameraPressed: () {},
                        onGalleryPressed: () {},
                      );
                    }),
                const CustomSize(
                  height: 10,
                ),
                CustomFileWidget(
                    fileName: 'Filename.docs',
                    onTap: () {
                      CustomAlertDialog.show(
                        context,
                        title: 'Choose an Option',
                        content:
                            'Select one of the following from where you want to upload',
                        onCameraPressed: () {},
                        onGalleryPressed: () {},
                      );
                    }),
                const CustomSize(
                  height: 40,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.home);
                  },
                  btnColor: AppColors.darkGreen,
                  text: 'Confirm',
                  textColor: Colors.white,
                ),
                const CustomSize(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
