import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Messages',
        showSearchIcon: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomText(
            label: '32 Contacts Available',
            color: AppColors.black,
            size: FontSize.xxMedium,
            weight: FontWeight.w600,
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: true,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: false,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: true,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: false,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: false,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
          CustomCardWidget(
            imagePath: AppImages.characterImage,
            name: 'John Doe',
            description:
                'Lorem ipsum dolor sit amet,\nconse ctetur adipiscing...',
            showGreenCircle: true,
            time: '5 mins',
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.chat);
            },
          ),
        ]),
      )),
    );
  }
}
