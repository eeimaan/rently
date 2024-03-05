import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyFurnished extends StatelessWidget {
  final bool isOpenFromSummary;
  const PropertyFurnished({super.key, required this.isOpenFromSummary});

  @override
  Widget build(BuildContext context) {
    final borderProvider = Provider.of<SelectedBorderProvider>(context);
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
            label: 'Is the property furnished?',
            size: FontSize.xMedium,
            weight: FontWeight.w600,
          ),
          const CustomSize(
            height: 10,
          ),
          CustomPropertyContainer(
              onTap: () {
                borderProvider.updateContainer10Color(context);
                propertyProvider.setFurnishing = 'Unfurnished';
                if (isOpenFromSummary) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.propertyRent, arguments: false);
                }
              },
              borderColor: Colors.transparent,
              child: const CustomText(
                label: 'Unfurnished',
                size: FontSize.xMedium,
                color: AppColors.darkGreen,
                weight: FontWeight.w700,
              )),
          const CustomSize(
            height: 10,
          ),
          CustomPropertyContainer(
              onTap: () {
                borderProvider.updateContainer10Color(context);
                propertyProvider.setFurnishing = 'Partially Furnished';
                if (isOpenFromSummary) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.propertyRent, arguments: false);
                }
              },
              borderColor: Colors.transparent,
              child: const CustomText(
                label: 'Partially Furnished',
                color: AppColors.darkGreen,
                size: FontSize.xMedium,
                weight: FontWeight.w700,
              )),
          const CustomSize(
            height: 10,
          ),
          CustomPropertyContainer(
            onTap: () {
              borderProvider.updateContainer10Color(context);
              propertyProvider.setFurnishing = 'Fully Furnished';
              if (isOpenFromSummary) {
                Navigator.pop(context);
              } else {
                Navigator.of(context)
                    .pushNamed(AppRoutes.propertyRent, arguments: false);
              }
            },
            borderColor: Colors.transparent,
            child: const CustomText(
              label: 'Fully Furnished',
              color: AppColors.darkGreen,
              size: FontSize.xMedium,
              weight: FontWeight.w700,
            ),
          ),
          const CustomSize(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
