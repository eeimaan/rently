import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  label: 'Create \nYour Account',
                  color: AppColors.white,
                  size: FontSize.xxLarge,
                  weight: FontWeight.w900,
                ),
                const CustomText(
                  label: 'Please enter your details',
                  color: AppColors.black,
                  size: 11,
                  weight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  label: 'Name',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Enter your name here',
                    fillColor: AppColors.white,
                    borderColor: AppColors.black,
                    keyboardType: TextInputType.name,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter name';
                      }

                      return null;
                    }),
                const CustomSize(
                  height: 10,
                ),
                const CustomText(
                  label: 'Email',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Enter email address',
                    fillColor: AppColors.white,
                    borderColor: AppColors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!isValidEmail(input)) {
                        return 'inValid';
                      }

                      return null;
                    }),
                const CustomSize(
                  height: 15,
                ),
                const CustomText(
                  label: 'Id Number (NRIC/Thai ID/Passport)',
                  color: AppColors.darkGreen,
                  size: FontSize.small,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 5,
                ),
                CustomTextField(
                    hintText: 'Enter Id Number',
                    fillColor: AppColors.white,
                    borderColor: AppColors.black,
                    keyboardType: TextInputType.number,
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter Id Number';
                      }

                      return null;
                    }),
                const CustomSize(
                  height: 15,
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
                  height: 40,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.createAccountOtp);
                  },
                  btnColor: AppColors.darkGreen,
                  text: 'Next',
                  textColor: Colors.white,
                ),
                const CustomSize(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.loginAccount);
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        label: 'Already have an account?',
                        color: AppColors.black,
                        size: 14,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w400,
                      ),
                      CustomText(
                        label: ' Login',
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
    );
  }
}
