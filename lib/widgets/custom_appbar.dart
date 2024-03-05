import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showSearchIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: AppColors.paleBlue),
            bottom: BorderSide(width: 1, color: AppColors.paleBlue),
          ),
        ),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: CustomText(
            label: title,
            size: FontSize.xMedium,
            weight: FontWeight.w500,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            if (showSearchIcon)
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.black),
                onPressed: () {},
              ),
          ],
          elevation: 0.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String characterImage;
  final String titleName;
  final String status;

  const CustomChatAppBar({
    Key? key,
    required this.characterImage,
    required this.titleName,
    required this.status,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: AppColors.paleBlue),
            bottom: BorderSide(width: 1, color: AppColors.paleBlue),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 6,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
            ),
            leadingWidth: 40,
            title: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                        color: AppColors.lightCayn,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          characterImage,
                          width: 40,
                          height: 38,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const CustomSize(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          label: titleName,
                          color: AppColors.black,
                          size: FontSize.xxMedium,
                          weight: FontWeight.w600,
                        ),
                        const CustomSize(
                          height: 5,
                        ),
                        Container(
                          width: 44,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: AppColors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Center(
                            child: CustomText(
                              label: status,
                              color: AppColors.white,
                              size: 10,
                              weight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                color: AppColors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72.0);
}
