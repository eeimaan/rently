import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CreateAccountOTPVerify extends StatelessWidget {
  const CreateAccountOTPVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.turquoise,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              const CustomText(
                label:
                    'We sent a text message to the phone number starting with\n+658860*****. Please enter the 6 digit code you received',
                color: AppColors.black,
                size: 11,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                label: 'OTP Verification',
                color: AppColors.darkGreen,
                size: FontSize.small,
                weight: FontWeight.w500,
              ),
              const CustomSize(
                height: 5,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                    width: 56,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
              const CustomSize(
                height: 30,
              ),
              CustomButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.createAccountPic);
                },
                btnColor: AppColors.darkGreen,
                text: 'Next',
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
