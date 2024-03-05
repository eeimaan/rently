import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/screens/screens.dart';
import 'package:rent_fix/utils/app_utils.dart';
import 'package:rent_fix/widgets/widgets.dart';

class PropertyPhotos extends StatefulWidget {
  final bool isOpenFromSummary;
  final List<String> preloadedImages;
  const PropertyPhotos(
      {super.key,
      required this.isOpenFromSummary,
      required this.preloadedImages});

  @override
  State<PropertyPhotos> createState() => _PropertyPhotosState();
}

class _PropertyPhotosState extends State<PropertyPhotos> {
  late ImagePickerProvider imagePickerProvider;
  final globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    imagePickerProvider =
        Provider.of<ImagePickerProvider>(context, listen: false);

    Future.delayed(Duration.zero).then((value) {
      imagePickerProvider.setPaths = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'List Your Property',
        showSearchIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomText(
              label: 'Add some photos of your house',
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 20,
            ),
            const CustomText(
              label:
                  'You are recommended to upload at least 5 photos. You can add more or make changes later.',
              color: AppColors.darkGreen,
              size: FontSize.xxMedium,
              weight: FontWeight.w500,
            ),
            const CustomSize(
              height: 40,
            ),
            Consumer<ImagePickerProvider>(
              builder: (context, imagePick, child) {
                if (widget.preloadedImages.isNotEmpty) {
                  return SizedBox(
                    height: 250,
                    width: mq.width,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: widget.preloadedImages.length,
                      itemBuilder: (context, index) {
                        return _buildImagePreview(
                            widget.preloadedImages[index]);
                      },
                    ),
                  );
                } else if (imagePick.paths.isEmpty) {
                  return Container();
                } else {
                  return SizedBox(
                    height: 250,
                    width: mq.width,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: imagePick.paths.length,
                      itemBuilder: (context, index) {
                        return _buildImagePreview(imagePick.paths[index]);
                      },
                    ),
                  );
                }
              },
            ),
            const CustomSize(
              height: 10,
            ),
            CustomButton(
              width: mq.width,
              onPressed: () async {
                List<String> images = await AppUtils.getImagesFromGallery();
                if (images.isEmpty) return;
                imagePickerProvider.addPaths(images);
                widget.preloadedImages.addAll(images);
              },
              btnColor: AppColors.turquoise,
              borderColor: Colors.transparent,
              isChild: true,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  AppImages.galleryIcon,
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                const CustomSize(
                  width: 5,
                ),
                const CustomText(
                  label: 'Select from gallery',
                  size: FontSize.small,
                  weight: FontWeight.w600,
                  color: AppColors.white,
                )
              ]),
            ),
            const CustomSize(
              height: 20,
            ),
            CustomButton(
              width: mq.width,
              onPressed: () async {
                List<String> images = await AppUtils.getImagesFromCamera();
                if (images.isEmpty) return;
                imagePickerProvider.addPaths(images);
                widget.preloadedImages.addAll(images);
              },
              btnColor: AppColors.white,
              borderColor: AppColors.black,
              isChild: true,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  AppImages.camIcon,
                  colorFilter:
                      const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                ),
                const CustomSize(
                  width: 5,
                ),
                const CustomText(
                  label: 'Use Camera',
                  size: FontSize.small,
                  weight: FontWeight.w600,
                  color: AppColors.black,
                )
              ]),
            ),
            const CustomSize(
              height: 20,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                int totalImageCount = imagePickerProvider.paths.length +
                    widget.preloadedImages.length;

                if (totalImageCount < 5) {
                  CustomSnackBar.show(
                    context: context,
                    text: 'You must upload at least 5 photos.',
                    backgroundColor: Colors.red,
                  );
                } else {
                  propertyProvider.setListPhotos =
                      imagePickerProvider.paths + widget.preloadedImages;

                  if (widget.isOpenFromSummary) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PropertyListingDetails(
                              isOpenFromSummary: false,
                              preloadedImages: propertyProvider.getListPhotos,
                            )));
                  } else {
                    Navigator.of(context).pushNamed(AppRoutes.propertyDate);
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

  Widget _buildImagePreview(String imagePath) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              File(imagePath),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            imagePickerProvider.removeImage(imagePath);
            widget.preloadedImages.remove(imagePath);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppImages.deleteIcon,
            ),
          ),
        ),
      ],
    );
  }
}
