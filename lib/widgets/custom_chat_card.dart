import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String time;
  final String description;
  final bool showGreenCircle;
  final VoidCallback ontap;

  const CustomCardWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.description,
    this.showGreenCircle = false,
    required this.time,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 98,
          padding: const EdgeInsets.only(top: 14, left: 10, bottom: 14),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: AppColors.lightBlack,
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: AppColors.lightCayn,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        width: 40,
                        height: 38,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (showGreenCircle)
                    Positioned(
                      top: 4,
                      left: 50,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      label: name,
                      color: AppColors.black,
                      size: FontSize.xMedium,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      label: description,
                      color: AppColors.black,
                      size: FontSize.xxMedium,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: CustomText(
                        label: time,
                        color: AppColors.lightGrey,
                        size: 10,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
