import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? width;
  final BoxDecoration? decoration;
  final Color? shapeColor;
  final bool isShape;
  final BoxDecoration? shapeDecoration;
  final ShapeBorder? borderShape;
  final Gradient? gradient;
  final Shadow? shadow;
  final Widget? child;

  const CustomContainer({
    Key? key,
    this.height,
    this.width,
    this.decoration,
    this.shapeColor,
    this.child,
    this.color,
    this.shadow,
    this.gradient,
    this.isShape = false,
    this.shapeDecoration,
    this.borderShape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: shapeDecoration ?? decoration,
      child: child,
    );
  }
}

class ActivityContainer extends StatelessWidget {
  final Color status;
  final String time;
  final String title;

  const ActivityContainer(
      {super.key,
      required this.status,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListTile(
          leading: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: status,
              shape: BoxShape.circle,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFAAB4CF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerView extends StatefulWidget {
  final String text;
  final Color? containercolor;
  final Color? textColor;
  final double? widthcontainer;

  const ContainerView({
    Key? key,
    required this.text,
    this.containercolor,
    this.textColor,
    this.widthcontainer,
  }) : super(key: key);

  @override
  ContainerViewState createState() => ContainerViewState();
}

class ContainerViewState extends State<ContainerView> {
  Color containerColor = AppColors.paleAqua;
  Color textColor = AppColors.darkGreen;

  void _handleTap() {
    setState(() {
      if (containerColor == AppColors.paleAqua) {
        containerColor = AppColors.turquoise;
        textColor = Colors.white;
      } else {
        containerColor = AppColors.paleAqua;
        textColor = AppColors.darkGreen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Column(
        children: [
          Container(
            width: widget.widthcontainer,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: containerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckboxContainer extends StatelessWidget {
  final String text;
  final bool value;

  const CheckboxContainer({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.pastelBlue),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                label: text,
                color: AppColors.darkGreen,
                size: 12,
                weight: FontWeight.w500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSize(
                  height: 8,
                  width: 08,
                  child: Checkbox(
                    value: value,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: AppColors.darkGreen,
                    side: const BorderSide(color: AppColors.darkGreen),
                    onChanged: (bool? newValue) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomPropertyContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color borderColor;

  const CustomPropertyContainer({
    super.key,
    required this.child,
    this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: mq.width,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: const Color(0xFFCCF3F5),
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [child],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyContainer extends StatelessWidget {
  final Widget child;

  const PropertyContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: mq.width,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.turquoise),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [child],
          ),
        ),
      ],
    );
  }
}

class SummaryContainer extends StatelessWidget {
  final String headingText;
  final String detailText;

  final VoidCallback? onTap;
  const SummaryContainer(
      {super.key,
      required this.headingText,
      required this.detailText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShapeContainer(
        height: 82,
        decoration: ShapeDecoration(
          color: AppColors.paleAqua,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        label: headingText,
                        color: AppColors.darkGreen,
                        size: FontSize.xxMedium,
                        weight: FontWeight.w600,
                      ),
                      const CustomSize(
                        height: 3,
                      ),
                      CustomText(
                        label: detailText,
                        color: AppColors.darkGreen,
                        size: FontSize.xxMedium,
                        weight: FontWeight.w300,
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
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AppImages.editIcon,
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
    );
  }
}
