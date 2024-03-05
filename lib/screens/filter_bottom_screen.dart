import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _currentRangeValues = const RangeValues(200, 1300);

  RangeValues _currentRangesValues = const RangeValues(0, 3000);
  @override
  Widget build(BuildContext context) {
    TextEditingController sortbyController = TextEditingController();

    TextEditingController dateController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: screenWidth * 0.45,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD8F9FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const CustomText(
              label: 'Filters',
              size: FontSize.large,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 70, bottom: 5),
              child: Row(
                children: [
                  CustomText(
                    label: 'Sort by',
                    color: AppColors.darkGreen,
                    size: FontSize.xxMedium,
                    weight: FontWeight.w500,
                  ),
                  Spacer(),
                  CustomText(
                    label: 'Move in Date',
                    color: AppColors.darkGreen,
                    size: FontSize.xxMedium,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  borderRadius: 8,
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.width * 0.115,
                  hintColor: AppColors.darkGreen,
                  readOnly: true,
                  hintText: 'Newest First',
                  borderColor: AppColors.pastelBlue,
                  controller: sortbyController,
                  suffixIcon: DropDownsWidget(
                    itemList: const [
                      'N',
                      'O',
                    ],
                    controller: sortbyController,
                    onChanged: (String? selectedOption) {
                      sortbyController.text = selectedOption ?? '';
                    },
                  ),
                  fillColor: AppColors.white,
                ),
                CustomTextField(
                  borderRadius: 8,
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.width * 0.115,
                  hintColor: AppColors.darkGreen,
                  readOnly: true,
                  hintText: '17/12/23',
                  borderColor: AppColors.pastelBlue,
                  controller: dateController,
                  suffixIcon: DropDownsWidget(
                    itemList: const ['1', '2', '3'],
                    controller: dateController,
                    onChanged: (String? selectedOption) {
                      dateController.text = selectedOption ?? '';
                    },
                  ),
                  fillColor: AppColors.white,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Price Range',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 1500,
              divisions: 15,
              activeColor: AppColors.turquoise,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Property Type',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CheckboxContainer(
                  text: 'Apartment',
                  value: false,
                ),
                CustomSize(width: 5),
                CheckboxContainer(
                  text: 'Condo',
                  value: true,
                ),
                CustomSize(width: 5),
                CheckboxContainer(
                  text: 'Landed',
                  value: false,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Rental Type',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerView(
                  text: 'Entire Unit',
                  widthcontainer: screenWidth * 0.45,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: 'Room',
                  widthcontainer: screenWidth * 0.45,
                ),
              ],
            ),
            const CustomSize(width: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerView(
                  text: 'Ensuit',
                  widthcontainer: screenWidth * 0.45,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: 'Studio',
                  widthcontainer: screenWidth * 0.45,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Furnishing Status',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerView(
                  text: 'Unfurnished',
                  widthcontainer: screenWidth * 0.45,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: 'Partially Furnished',
                  widthcontainer: screenWidth * 0.45,
                ),
              ],
            ),
            const CustomSize(width: 5),
            ContainerView(
              text: 'Furnished',
              widthcontainer: screenWidth * 0.45,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Number of Bedrooms',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomSize(width: 5),
                ContainerView(
                  text: '1',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '2',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '3',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '4',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '5+',
                  widthcontainer: screenWidth * 0.165,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Number of Bathrooms',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomSize(width: 5),
                ContainerView(
                  text: '1',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '2',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '3',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '4',
                  widthcontainer: screenWidth * 0.165,
                ),
                const CustomSize(width: 5),
                ContainerView(
                  text: '5+',
                  widthcontainer: screenWidth * 0.165,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                label: 'Floor Area',
                color: AppColors.darkGreen,
                size: FontSize.xxMedium,
                weight: FontWeight.w500,
              ),
            ),
            RangeSlider(
              values: _currentRangesValues,
              min: 0,
              max: 4000,
              divisions: 4,
              activeColor: AppColors.turquoise,
              labels: RangeLabels(
                _currentRangesValues.start.round().toString(),
                _currentRangesValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangesValues = values;
                });
              },
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {},
              btnColor: AppColors.turquoise,
              borderColor: Colors.transparent,
              text: 'Apply Filters',
              textColor: AppColors.white,
            ),
            const CustomSize(height: 35),
          ],
        ),
      ),
    );
  }
}
