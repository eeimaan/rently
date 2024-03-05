import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.turquoise,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSize(
                        height: 20,
                      ),
                      SvgPicture.asset(
                        AppImages.splashLogo,
                        height: 100,
                      ),
                      const CustomSize(
                        height: 10,
                      ),
                      const CustomText(
                        label: 'Login\nAccount',
                        color: AppColors.white,
                        size: FontSize.xxLarge,
                        weight: FontWeight.w900,
                      ),
                      const CustomSize(
                        height: 30,
                      ),
                      const CustomText(
                        label: 'Phone Number',
                        color: AppColors.darkGreen,
                        size: FontSize.small,
                        weight: FontWeight.w500,
                      ),
                      const CustomSize(
                        height: 5,
                      ),
                      const CustomTextField(
                        hintText: 'Enter phone number here',
                        fillColor: AppColors.white,
                        borderColor: AppColors.black,
                      ),
                      const CustomSize(
                        height: 30,
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        btnColor: AppColors.darkGreen,
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.otpVerify);
                        },
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                        text: 'Submit',
                      ),
                      const CustomSize(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.signInScreen);
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              label: 'Dont have an account?',
                              color: AppColors.black,
                              size: 14,
                              textAlign: TextAlign.center,
                              weight: FontWeight.w400,
                            ),
                            CustomText(
                              label: ' Sign Up',
                              color: AppColors.white,
                              size: 14,
                              textAlign: TextAlign.center,
                              weight: FontWeight.w800,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(AppImages.smallHouse)))
          ],
        ),
      ),
    );
  }
}
