import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/db_servies/db_servies.dart';
import 'package:rent_fix/models/models.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/screens/screens.dart';
import 'package:rent_fix/utils/app_utils.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyListingDetails extends StatefulWidget {
  final bool isOpenFromSummary;
  final List<String> preloadedImages;
  const PropertyListingDetails(
      {super.key,
      required this.isOpenFromSummary,
      required this.preloadedImages});

  @override
  State<PropertyListingDetails> createState() => _PropertyListingDetailsState();
}

class _PropertyListingDetailsState extends State<PropertyListingDetails> {
  late PropertyProvider imagePickerProvider;

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
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomText(
              label: 'Summary',
              size: FontSize.xxLarge,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const PropertyAddress(
                            isOpenFromSummary: true,
                          )),
                    );
                  },
                  headingText: 'Name',
                  detailText: property.getName,
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const PropertyAddress(
                            isOpenFromSummary: true,
                          )),
                    );
                  },
                  headingText: 'Address',
                  detailText: property.getAddress,
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyBedroom(
                              isOpenFromSummary: true,
                            )));
                  },
                  headingText: 'Bedroom',
                  detailText: property.getBedroom,
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyBedroom(
                              isOpenFromSummary: true,
                            )));
                  },
                  headingText: 'Drawingroom',
                  detailText: property.getdrawingroom,
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyBathroom(
                              isOpenFromSummary: true,
                            )));
                  },
                  headingText: 'Tvlauvh Room',
                  detailText: property.gettvroom,
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Bathroom',
                  detailText: property.getBathroom,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyBathroom(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Size',
                  detailText: property.getAppartmentSize,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyApparmentSize(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Property type',
                  detailText: property.getPropertyType,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyType(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'What are you renting',
                  detailText: property.getAgreement,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyRentalAgreement(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Furnishing',
                  detailText: property.getFurnishing,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyFurnished(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Amount',
                  detailText: property.getRent,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyMonthlyRent(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                  headingText: 'Available for rent',
                  detailText: property.getAvaliableDate,
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const PropertyDate(
                              isOpenFromSummary: true,
                            )));
                  },
                );
              },
            ),
            const CustomSize(
              height: 10,
            ),
            Consumer<PropertyProvider>(
              builder: (context, property, child) {
                return SummaryContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const PropertyDescription(
                                isOpenFromSummary: true,
                              )));
                    },
                    headingText: 'Property description',
                    detailText: property.description);
              },
            ),
            const CustomSize(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: PropertyPhotos(
                          isOpenFromSummary: true,
                          preloadedImages: propertyProvider.getListPhotos,
                        )));
              },
              child: ShapeContainer(
                height: 122,
                decoration: ShapeDecoration(
                  color: AppColors.paleAqua,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                label: 'Property Images',
                                color: AppColors.darkGreen,
                                size: FontSize.xxMedium,
                                weight: FontWeight.w600,
                              ),
                              const CustomSize(
                                height: 3,
                              ),
                              Consumer<PropertyProvider>(
                                builder: (context, property, child) {
                                  if (property.getListPhotos.isEmpty) {
                                    return Container();
                                  } else {
                                    return SizedBox(
                                        width: 240,
                                        height: 64,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              property.getListPhotos.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: _buildImagePreview(
                                                property.getListPhotos[index],
                                              ),
                                            );
                                          },
                                        ));
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShapeContainer(
                                width: 32,
                                height: 32,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: SvgPicture.asset(
                                    AppImages.editIcon,
                                    width: 14,
                                    height: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const CustomSize(
              height: 10,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () async {
                AppUtils.showCircularIndicator(context);
                PropertyModel propertydata = PropertyModel(
                    name: propertyProvider.getName,
                    address: propertyProvider.getAddress,
                    bedrooms: int.parse(propertyProvider.getBedroom),
                    bathrooms: int.parse(propertyProvider.getBathroom),
                    drawingrooms: int.parse(propertyProvider.getdrawingroom),
                    tvrooms: int.parse(propertyProvider.gettvroom),
                    appartmentSize:
                        int.parse(propertyProvider.getAppartmentSize),
                    propertyType: propertyProvider.getPropertyType,
                    rentAggrement: propertyProvider.getAgreement,
                    furnishing: propertyProvider.getFurnishing,
                    rent: int.parse(propertyProvider.getRent),
                    date: propertyProvider.getAvaliableDate,
                    description: propertyProvider.getDescription,
                    images: propertyProvider.getListPhotos,
                    id: '',
                    propertyListDate: '');
                await CloudServices.uploadPropertyDataToFirebase(
                  context: context,
                  propertyModel: propertydata,
                );
              },
              btnColor: AppColors.turquoise,
              borderColor: Colors.transparent,
              textColor: AppColors.white,
              text: 'Next',
            ),
            const CustomSize(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildImagePreview(String imagePath) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
            height: 64,
            width: 64,
          ),
        ),
      ],
    );
  }
}
