import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyMonthlyRent extends StatefulWidget {
  final bool isOpenFromSummary;
  const PropertyMonthlyRent({super.key, required this.isOpenFromSummary});

  @override
  State<PropertyMonthlyRent> createState() => _PropertyMonthlyRentState();
}

class _PropertyMonthlyRentState extends State<PropertyMonthlyRent> {
  TextEditingController rentController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
    rentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'List Your Property',
        showSearchIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: globalKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomText(
              label:
                  'How much should the price per month be for this unit? The final price can be adjusted in the contract.',
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 10,
            ),
            const CustomText(
              label: 'Monthly Rent',
              color: AppColors.darkGreen,
              size: FontSize.xxMedium,
              weight: FontWeight.w500,
            ),
            const CustomSize(
              height: 10,
            ),
            CustomTextField(
                borderRadius: 15,
                hintText: 'Enter amount in S\$',
                borderColor: AppColors.pastelBlue,
                controller: rentController,
                fillColor: AppColors.white,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                validator: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter amount';
                  }
                  if (!isValidInput(input)) {
                    return 'inValid';
                  }
                  return null;
                }),
            const CustomSize(
              height: 10,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  propertyProvider.setRent = rentController.text;
                  if (widget.isOpenFromSummary) {
                    Navigator.pop(context);
                  } else {
                    Navigator.of(context).pushNamed(AppRoutes.propertyPhotos);
                  }
                }
              },
              btnColor: AppColors.turquoise,
              borderColor: Colors.transparent,
              textColor: AppColors.white,
              text: 'Next',
            ),
          ]),
        ),
      ),
    );
  }
}
