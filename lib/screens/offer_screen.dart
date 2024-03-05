import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/db_servies/cloud_services.dart';
import 'package:rent_fix/models/models.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/utils/app_utils.dart';
import 'package:rent_fix/widgets/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> pageNotifier = ValueNotifier(0);
  DateTime selectedDate = DateTime.now();
  final globalKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController rentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Make an Offer'),
      body: Column(
        children: [
          const CustomSize(
            height: 20,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(child: _buildTab(index: 0)),
                  Expanded(child: _buildTab(index: 1)),
                  Expanded(child: _buildTab(index: 2)),
                  Expanded(child: _buildTab(index: 3))
                ],
              ),
            ),
          ),
          const CustomSize(
            height: 10,
          ),
          Flexible(
            flex: 9,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                pageNotifier.value = index;
              },
              children: [
                _firstScreen(),
                _secondOffer(),
                _thirdOffer(),
                _fourthScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({required int index}) {
    return ValueListenableBuilder(
      valueListenable: pageNotifier,
      builder: (context, pageIndex, child) => Container(
          height: 5,
          decoration: BoxDecoration(
            color: pageIndex > index
                ? AppColors.turquoise
                : pageIndex == index
                    ? AppColors.darkGreen
                    : AppColors.paleAqua,
            borderRadius: BorderRadius.circular(50),
          )),
    );
  }

  Widget _firstScreen() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSize(
            height: 10,
          ),
          const CustomText(
            label: 'When does the tenant want to move in?',
            color: AppColors.black,
            size: FontSize.xMedium,
            weight: FontWeight.w600,
          ),
          const CustomSize(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.turquoise)),
              height: 250,
              child: SfDateRangePicker(
                showNavigationArrow: true,
                monthViewSettings: const DateRangePickerMonthViewSettings(),
                selectionColor: AppColors.turquoise,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  selectedDate = args.value;
                },
              )),
          const CustomSize(
            height: 20,
          ),
          CustomButton(
            borderColor: Colors.transparent,
            btnColor: AppColors.turquoise,
            text: 'Next',
            textColor: Colors.white,
            onPressed: () {
              context.read<OfferModelProvider>().setAvaliableDate =
                  AppUtils.formatDateWithoutTime(selectedDate);

              _pageController.jumpToPage(1);
            },
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Widget _secondOffer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSize(
              height: 10,
            ),
            const CustomText(
              label: 'How long does the tenant want to\n rent for?',
              color: AppColors.black,
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 20,
            ),
            const CustomText(
              label: 'Rental Duration',
              color: AppColors.darkGreen,
              size: FontSize.xxMedium,
              weight: FontWeight.w500,
            ),
            const CustomSize(
              height: 5,
            ),
            CustomTextField(
                isBorder: true,
                borderColor: AppColors.pastelBlue,
                hintText: 'Enter the number of months',
                fillColor: Colors.white,
                controller: rentController,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                validator: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter Number of Months';
                  }
                  if (!isValidInput(input)) {
                    return 'inValid';
                  }
                  return null;
                }),
            const CustomSize(
              height: 20,
            ),
            CustomButton(
              borderColor: Colors.transparent,
              btnColor: AppColors.turquoise,
              textColor: Colors.white,
              text: 'Next',
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                context.read<OfferModelProvider>().setAgreement =
                    rentController.text;
                FocusScope.of(context).unfocus();
                if (globalKey.currentState!.validate()) {
                  _pageController.jumpToPage(2);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _thirdOffer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSize(
              height: 10,
            ),
            const CustomText(
              label: 'How much does the tenant wish to\n pay per month?',
              color: AppColors.black,
              size: FontSize.xMedium,
              weight: FontWeight.w600,
            ),
            const CustomSize(
              height: 20,
            ),
            const CustomText(
              label: 'Monthly Rent',
              color: AppColors.darkGreen,
              size: FontSize.xxMedium,
              weight: FontWeight.w500,
            ),
            const CustomSize(
              height: 5,
            ),
            CustomTextField(
                isBorder: true,
                controller: amountController,
                borderColor: AppColors.pastelBlue,
                hintText: 'Enter Amount in S\$',
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                fillColor: Colors.white,
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
              height: 20,
            ),
            CustomButton(
              borderColor: Colors.transparent,
              btnColor: AppColors.turquoise,
              textColor: Colors.white,
              text: 'Next',
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                context.read<OfferModelProvider>().setRent =
                    amountController.text;
                if (globalKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  _pageController.jumpToPage(4);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _fourthScreen() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomSize(
          height: 10,
        ),
        const CustomText(
          label: 'Summary',
          color: Colors.black,
          size: 24,
          weight: FontWeight.w600,
        ),
        const CustomSize(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _pageController.jumpToPage(0);
          },
          child: Consumer<OfferModelProvider>(
            builder: (context, offerModelProvider, child) {
              return _summaryContainer(
                'When does the tenant want to move in?\n',
                offerModelProvider.getAvaliableDate,
              );
            },
          ),
        ),
        const CustomSize(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _pageController.jumpToPage(1);
          },
          child: Consumer<OfferModelProvider>(
            builder: (context, offerModelProvider, child) {
              return _summaryContainer(
                'How long does the tenant want to rent for?\n',
                offerModelProvider.getAgreement,
              );
            },
          ),
        ),
        const CustomSize(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _pageController.jumpToPage(2);
          },
          child: Consumer<OfferModelProvider>(
            builder: (context, offerModelProvider, child) {
              return _summaryContainer(
                'How much does the tenant wish to pay per month?\n',
                offerModelProvider.getRent,
              );
            },
          ),
        ),
        const CustomSize(
          height: 10,
        ),
        CustomButton(
          borderColor: Colors.transparent,
          btnColor: AppColors.turquoise,
          text: 'Submit',
          width: MediaQuery.of(context).size.width,
          textColor: AppColors.white,
          onPressed: () async {
            OfferModel offerdata = OfferModel(
                rentAggrement: context.read<OfferModelProvider>().getAgreement,
                rent: int.parse(context.read<OfferModelProvider>().getRent),
                date: context.read<OfferModelProvider>().getAvaliableDate);
            AppUtils.showCircularIndicator(context);
            await CloudServices.uploadOfferDataToFirebase(
              context: context,
              offerModel: offerdata,
            );
          },
        )
      ]),
    );
  }

  Widget _summaryContainer(String firstTitle, String secondTitle) {
    return ShapeContainer(
      height: 82,
      decoration: ShapeDecoration(
        color: AppColors.paleAqua,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: firstTitle,
                          style: const TextStyle(
                            color: AppColors.darkGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                        text: secondTitle,
                        style: const TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShapeContainer(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
