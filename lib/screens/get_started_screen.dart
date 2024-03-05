import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.turquoise,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      label: 'Find Your\nPerfect Place',
                      color: AppColors.white,
                      size: FontSize.exLarge,
                      height: 1,
                      weight: FontWeight.w900,
                    ),
                    const CustomSize(
                      height: 10,
                    ),
                    CustomButton(
                      width: mq.width * 0.45,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.loginAccount);
                      },
                      textColor: AppColors.turquoise,
                      borderColor: Colors.transparent,
                      text: 'GET STARTED',
                    ),
                    const CustomSize(
                      height: 10,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By tapping Continue, you agree to our ',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Condition',
                            style: TextStyle(
                              decorationColor: AppColors.white,
                              color: Colors.white,
                              fontSize: FontSize.small,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              height: 0.11,
                            ),
                          ),
                          WidgetSpan(
                              child: SizedBox(
                            height: 30,
                          )),
                          TextSpan(
                            text: ' & ',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: FontSize.small,
                              decorationColor: Colors.white,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomSize(
              height: mq.height * 0.13,
            ),
            Flexible(
              flex: 5,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppImages.layerHouse,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
    /////
  }
}
