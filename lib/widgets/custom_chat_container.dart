import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class ChatUserContainer extends StatelessWidget {
  final String message;
  final String time;

  const ChatUserContainer({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: CustomContainer(
        decoration: const BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                label: message,
                color: AppColors.white,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
              const CustomSize(
                height: 5,
              ),
              CustomText(
                label: time,
                color: AppColors.lightGrey,
                size: 10,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatContainer extends StatelessWidget {
  final String message;
  final String time;
  final String? image;

  const ChatContainer({
    Key? key,
    required this.message,
    required this.time,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Align(
        alignment: Alignment.topRight,
        child: CustomContainer(
          decoration: const BoxDecoration(
            color: AppColors.paleBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      image!,
                      width: 226,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (image != null)
                  const CustomSize(
                    height: 5,
                  ),
                CustomText(
                  label: message,
                  color: AppColors.black,
                  size: FontSize.xxMedium,
                  weight: FontWeight.w500,
                ),
                const CustomSize(
                  height: 5,
                ),
                CustomText(
                  label: time,
                  color: AppColors.lightGrey,
                  size: 10,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
