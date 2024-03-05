import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class ListingDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const ListingDetails({super.key, required this.data});

  @override
  State<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final CarouselController controller = CarouselController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Listing Details',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSize(
                height: 10,
              ),
              CarouselSlider.builder(
                itemCount: (widget.data[AppText.image] as List<dynamic>).length,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) =>
                    SizedBox(
                  width: width,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            (widget.data[AppText.image]
                                as List<dynamic>)[itemIndex],
                            fit: BoxFit.cover,
                            width: width,
                            height: 220,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28, bottom: 10),
                        child: ShapeContainer(
                          width: 51,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                label:
                                    '${itemIndex + 1} of ${(widget.data[AppText.image] as List<dynamic>).length}',
                                color: AppColors.darkGreen,
                                size: FontSize.xsmall,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                carouselController: controller,
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastOutSlowIn,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  disableCenter: false,
                  autoPlay: false,
                  enlargeFactor: 0.5,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: false,
                  padEnds: false,
                  height: 220,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                ),
              ),
              const CustomSize(
                height: 10,
              ),
              Row(
                children: [
                  ShapeContainer(
                    height: 27,
                    decoration: ShapeDecoration(
                      color: AppColors.paleAqua,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomText(
                          label: widget.data[AppText.propertyType],
                          color: AppColors.darkGreen,
                          size: FontSize.small,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const CustomSize(
                    height: 10,
                  ),
                  ShapeContainer(
                    height: 27,
                    decoration: ShapeDecoration(
                      color: AppColors.paleAqua,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomText(
                          label: widget.data[AppText.rentAggrement],
                          color: AppColors.darkGreen,
                          size: FontSize.small,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomSize(
                height: 10,
              ),
              CustomText(
                label: widget.data[AppText.name],
                color: AppColors.black,
                size: 23,
                weight: FontWeight.w600,
              ),
              const CustomSize(
                height: 2,
              ),
              const CustomSize(
                height: 5,
              ),
              Row(
                children: [
                  CustomText(
                    label: '\$${widget.data[AppText.rent].toString()}',
                    color: const Color(0xFF35D5DA),
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  const CustomText(
                    label: ' /month',
                    color: Color(0xFF35D5DA),
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              const CustomSize(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.svBed,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkGreen, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 10,
                  ),
                  CustomText(
                    label: widget.data[AppText.bedroom].toString(),
                    color: AppColors.darkGreen,
                    size: FontSize.small,
                    weight: FontWeight.w500,
                  ),
                  const CustomSize(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    AppImages.svSofa,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkGreen, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 8,
                  ),
                  CustomText(
                    label: widget.data[AppText.drawingroom].toString(),
                    color: AppColors.darkGreen,
                    size: FontSize.small,
                    weight: FontWeight.w500,
                  ),
                  const CustomSize(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    AppImages.svTrash,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkGreen, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 8,
                  ),
                  CustomText(
                    label: widget.data[AppText.bathroom].toString(),
                    color: AppColors.darkGreen,
                    size: FontSize.small,
                    weight: FontWeight.w500,
                  ),
                  const CustomSize(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    AppImages.svTv,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkGreen, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 8,
                  ),
                  CustomText(
                    label: widget.data[AppText.tvroom].toString(),
                    color: AppColors.darkGreen,
                    size: FontSize.small,
                    weight: FontWeight.w500,
                  ),
                  const CustomSize(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    AppImages.svArea,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkGreen, BlendMode.srcIn),
                  ),
                  const CustomSize(
                    width: 8,
                  ),
                  CustomText(
                    label: widget.data[AppText.appartmentSize].toString(),
                    color: AppColors.darkGreen,
                    size: FontSize.small,
                    weight: FontWeight.w500,
                  )
                ],
              ),
              const CustomSize(
                height: 10,
              ),
              CustomButton(
                width: MediaQuery.of(context).size.width,
                isChild: true,
                borderColor: Colors.transparent,
                btnColor: AppColors.paleAqua,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.darkGreen,
                    ),
                    const CustomSize(
                      width: 10,
                    ),
                    CustomText(
                      label:
                          'Available by: ${widget.data[AppText.availableDate]}',
                      color: AppColors.darkGreen,
                      size: FontSize.xxMedium,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              const CustomSize(
                height: 10,
              ),
              const CustomDivider(
                color: AppColors.turquoise,
              ),
              const CustomSize(
                height: 10,
              ),
              const CustomText(
                label: 'Details',
                color: AppColors.black,
                size: FontSize.large,
                weight: FontWeight.w600,
              ),
              const CustomSize(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _columnWidget(
                        'Area',
                        widget.data[AppText.appartmentSize].toString(),
                      ),
                      const CustomSize(
                        height: 15,
                      ),
                      _columnWidget(
                        'PropertyType',
                        widget.data[AppText.propertyType],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _columnWidget(
                            'Condition', widget.data[AppText.furnishing]),
                        const CustomSize(
                          height: 15,
                        ),
                        _columnWidget(
                            'RentalType', widget.data[AppText.rentAggrement]),
                      ],
                    ),
                  ),
                ],
              ),
              const CustomSize(
                height: 15,
              ),
              _columnWidget(
                  'Listed Date', widget.data[AppText.propertyListDate]),
              const CustomSize(
                height: 10,
              ),
              const CustomDivider(
                color: AppColors.turquoise,
              ),
              const CustomSize(
                height: 5,
              ),
              const CustomText(
                label: 'About this place',
                color: Colors.black,
                size: 20,
                weight: FontWeight.w600,
              ),
              const CustomSize(
                height: 5,
              ),
              CustomText(
                label: widget.data[AppText.description],
                color: AppColors.lightGrey,
                size: 14,
                overflow: TextOverflow.ellipsis,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDivider(
                color: AppColors.turquoise,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.turquoise,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    AppImages.map,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 88,
                decoration: ShapeDecoration(
                  color: AppColors.paleAqua,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.youngMen),
                        radius: 30,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            label: 'Shakil Awan',
                            color: AppColors.black,
                            size: FontSize.medium,
                            weight: FontWeight.w700,
                          ),
                          CustomText(
                            label: 'Owner',
                            size: FontSize.xMedium,
                            color: AppColors.lightGrey,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ShapeContainer(
                        width: 48,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: AppColors.blueshade,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            AppImages.svChat,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      /* Container(
                        width: 48,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: AppColors.greens,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            AppImages.svLine,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                width: MediaQuery.of(context).size.width,
                borderColor: Colors.transparent,
                text: 'Make Offer',
                textColor: Colors.white,
                btnColor: AppColors.turquoise,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.offer);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnWidget(String? firstText, String secondText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          label: '$firstText',
          color: const Color(0xFF105456),
          size: 14,
          weight: FontWeight.w500,
        ),
        const CustomSize(
          height: 5,
        ),
        CustomText(
          label: secondText,
          color: const Color(0xFF8FA0B3),
          size: 14,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
