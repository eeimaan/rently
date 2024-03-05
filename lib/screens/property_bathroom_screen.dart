import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyBathroom extends StatelessWidget {
  final bool isOpenFromSummary;
  const PropertyBathroom({super.key, required this.isOpenFromSummary});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    final bathroomProvider = Provider.of<BathroomProvider>(context);
    final tvlauchProvider = Provider.of<TvlaunchProvider>(context);
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'List Your Property',
        showSearchIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomText(
            label: 'How many rooms?',
            size: FontSize.xMedium,
            weight: FontWeight.w600,
          ),
          const CustomSize(
            height: 20,
          ),
          const CustomText(
            label: 'Numbers of Bedrooms',
            color: AppColors.darkGreen,
            size: FontSize.xxMedium,
            weight: FontWeight.w500,
          ),
          const CustomSize(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              bathroomProvider.decrementBathroom();
            },
            child: Container(
              width: mq.width,
              height: 56,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: AppColors.teal),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(children: [
                Container(
                  width: 72,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: AppColors.skyBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: AppColors.teal),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: AppColors.darkGreen,
                  )),
                ),
                const Spacer(),
                CustomText(
                  label: '${bathroomProvider.bathroomCount}',
                  color: AppColors.darkGreen,
                  size: FontSize.xMedium,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    bathroomProvider.incrementBathroom();
                  },
                  child: Container(
                    width: 72,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: AppColors.skyBlue,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: AppColors.teal),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: AppColors.darkGreen,
                    )),
                  ),
                ),
              ]),
            ),
          ),
          const CustomSize(
            height: 50,
          ),
          const CustomText(
            label: 'Numbers of Tvlauch rooms',
            color: AppColors.darkGreen,
            size: FontSize.xxMedium,
            weight: FontWeight.w500,
          ),
          const CustomSize(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              tvlauchProvider.decrementtvlaunchroom();
            },
            child: Container(
              width: mq.width,
              height: 56,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: AppColors.teal),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(children: [
                Container(
                  width: 72,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: AppColors.skyBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: AppColors.teal),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: AppColors.darkGreen,
                  )),
                ),
                const Spacer(),
                CustomText(
                  label: '${tvlauchProvider.tvlaunchRoomCount}',
                  color: AppColors.darkGreen,
                  size: FontSize.xMedium,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    tvlauchProvider.incrementtvlaunchroom();
                  },
                  child: Container(
                    width: 72,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: AppColors.skyBlue,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: AppColors.teal),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: AppColors.darkGreen,
                    )),
                  ),
                ),
              ]),
            ),
          ),
          const CustomSize(
            height: 50,
          ),
          CustomButton(
            width: mq.width,
            onPressed: () {
              propertyProvider.setBathroom =
                  '${bathroomProvider.bathroomCount}';
              propertyProvider.settvroom =
                  '${tvlauchProvider.tvlaunchRoomCount}';
              if (isOpenFromSummary) {
                Navigator.pop(context);
              } else {
                Navigator.of(context).pushNamed(AppRoutes.propertyfurnished);
              }
            },
            btnColor: AppColors.turquoise,
            borderColor: Colors.transparent,
            textColor: AppColors.white,
            text: 'Next',
          ),
        ]),
      ),
    );
  }
}
