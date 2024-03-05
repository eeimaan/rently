import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyDescription extends StatefulWidget {
  final bool isOpenFromSummary;
  const PropertyDescription({super.key, required this.isOpenFromSummary});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  TextEditingController descriptionController = TextEditingController();

  final globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
    descriptionController.dispose();
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
              label: 'Write a short description of this property.',
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 10,
            ),
            const CustomText(
              label: 'Description',
              color: AppColors.darkGreen,
              size: FontSize.xxMedium,
              weight: FontWeight.w500,
            ),
            const CustomSize(
              height: 10,
            ),
            SizedBox(
              height: 160,
              child: CustomTextField(
                  borderRadius: 15,
                  maxLines: 10,
                  hintText: 'Enter description here',
                  borderColor: AppColors.pastelBlue,
                  controller: descriptionController,
                  fillColor: AppColors.white,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter description';
                    }

                    return null;
                  }),
            ),
            const CustomSize(
              height: 50,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pushNamed(AppRoutes.propertyList);
                  propertyProvider.setDescription = descriptionController.text;
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
