import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Profile',
        showSearchIcon: false,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const CustomSize(
                  height: 20,
                ),
                CustomContainer(
                  width: mq.width * 0.35,
                  height: mq.height * 0.16,
                  shapeDecoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.turquoise,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage(AppImages.profileImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const CustomSize(
                  height: 50,
                ),
                const CustomInfoContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        label: 'Name',
                        size: FontSize.small,
                        color: AppColors.lightGrey,
                        weight: FontWeight.w400,
                      ),
                      CustomSize(
                        height: 3,
                      ),
                      CustomText(
                        label: 'Jacob Jones',
                        size: FontSize.xxMedium,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const CustomSize(
                  height: 10,
                ),
                CustomInfoContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'Phone Number',
                            size: FontSize.small,
                            color: AppColors.lightGrey,
                            weight: FontWeight.w400,
                          ),
                          CustomSize(
                            height: 3,
                          ),
                          CustomText(
                            label: '+6512313214',
                            size: FontSize.xxMedium,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            width: mq.width * 0.11,
                            height: mq.height * 0.049,
                            shapeDecoration: BoxDecoration(
                              color: AppColors.paleBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                AppImages.editIcon,
                                width: 14,
                                height: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSize(
                  height: 10,
                ),
                CustomInfoContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'Email Address',
                            size: FontSize.small,
                            color: AppColors.lightGrey,
                            weight: FontWeight.w400,
                          ),
                          CustomSize(
                            height: 3,
                          ),
                          CustomText(
                            label: 'username@email.com',
                            size: FontSize.xxMedium,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomContainer(
                            width: mq.width * 0.11,
                            height: mq.height * 0.049,
                            shapeDecoration: BoxDecoration(
                              color: AppColors.paleBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                AppImages.editIcon,
                                width: 14,
                                height: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSize(
                  height: 10,
                ),
                const CustomInfoContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        label: 'Id Number (NRIC/FIN/Passport)',
                        size: FontSize.small,
                        color: AppColors.lightGrey,
                        weight: FontWeight.w400,
                      ),
                      CustomSize(
                        height: 3,
                      ),
                      CustomText(
                        label: 'S9345373FG',
                        size: FontSize.xxMedium,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const CustomSize(
                  height: 10,
                ),
                CustomInfoContainer(
                  height: 96,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'ID Verification',
                            size: FontSize.small,
                            color: AppColors.lightGrey,
                            weight: FontWeight.w400,
                          ),
                          CustomText(
                            label:
                                'Add front & back image of your ID Card\nand also a selfie of yourself with front\nof ID Card.',
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainer(
                            width: mq.width * 0.11,
                            height: mq.height * 0.049,
                            shapeDecoration: BoxDecoration(
                              color: AppColors.paleBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                size: FontSize.xxMedium,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSize(
                  height: 10,
                ),
                CustomInfoContainer(
                  height: 94,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'Bank statement and payslip Verification',
                            size: FontSize.small,
                            color: AppColors.lightGrey,
                            weight: FontWeight.w400,
                          ),
                          CustomSize(
                            height: 3,
                          ),
                          CustomText(
                            label:
                                'Add images of bank statement and payslip\nfor verification.',
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainer(
                            width: mq.width * 0.11,
                            height: mq.height * 0.049,
                            shapeDecoration: BoxDecoration(
                              color: AppColors.paleBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.add,
                                size: FontSize.xxMedium,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSize(
                  height: 40,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  text: 'save',
                  textColor: AppColors.white,
                  btnColor: AppColors.turquoise,
                  borderColor: Colors.transparent,
                ),
                const CustomSize(
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
            top: mq.height * 0.15,
            left: mq.width * 0.61,
            child: CustomContainer(
              width: mq.width * 0.11,
              height: mq.height * 0.05,
              shapeDecoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.turquoise,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  AppImages.cameraIcon,
                  width: 14,
                  height: 14,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomInfoContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  const CustomInfoContainer({
    Key? key,
    required this.child,
    this.height = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: mq.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.turquoise,
          width: 1,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 12, bottom: 10),
        child: child,
      ),
    );
  }
}
