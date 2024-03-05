import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyType extends StatefulWidget {
  final bool isOpenFromSummary;
  const PropertyType({super.key, required this.isOpenFromSummary});

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              label: 'What’s the property type?',
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 10,
            ),
            CustomPropertyContainer(
              onTap: () {
                borderProvider.updateContainer1Color(context);
                propertyProvider.setPropertyType = 'Apartment';
                if (widget.isOpenFromSummary) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pushNamed(AppRoutes.propertyAgreement);
                }
              },
              borderColor: borderProvider.container1Color,
              child: const CustomText(
                label: 'Apartment',
                size: FontSize.xMedium,
                color: AppColors.darkGreen,
                weight: FontWeight.w700,
              ),
            ),
            const CustomSize(
              height: 10,
            ),
            CustomPropertyContainer(
              onTap: () {
                borderProvider.updateContainer2Color(context);
                propertyProvider.setPropertyType = 'Condo';
                if (widget.isOpenFromSummary) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pushNamed(AppRoutes.propertyAgreement);
                }
              },
              borderColor: borderProvider.container2Color,
              child: const CustomText(
                label: 'Condo',
                color: AppColors.darkGreen,
                size: FontSize.xMedium,
                weight: FontWeight.w700,
              ),
            ),
            const CustomSize(
              height: 10,
            ),
            CustomPropertyContainer(
              onTap: () {
                borderProvider.updateContainer3Color(context);
                propertyProvider.setPropertyType = 'Landed';
                if (widget.isOpenFromSummary) {
                  Navigator.pop(context);
                } else {
                  Navigator.of(context).pushNamed(AppRoutes.propertyAgreement);
                }
              },
              borderColor: borderProvider.container3Color,
              child: const CustomText(
                label: 'Landed',
                color: AppColors.darkGreen,
                size: FontSize.xMedium,
                weight: FontWeight.w700,
              ),
            ),
            const CustomSize(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
