import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/screens/screens.dart';
import 'package:rent_fix/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BottomNavigationProvider _bottomNavigationProvider;

  @override
  void initState() {
    super.initState();
    _bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, indexValue, child) => Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(indexValue.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 12),
                child: SvgPicture.asset(
                  AppImages.home,
                  colorFilter: ColorFilter.mode(
                    indexValue.selectedIndex == 0
                        ? AppColors.darkGreen
                        : AppColors.pastelBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 12),
                child: SvgPicture.asset(
                  AppImages.search,
                  colorFilter: ColorFilter.mode(
                    indexValue.selectedIndex == 1
                        ? AppColors.darkGreen
                        : AppColors.pastelBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: "Discover",
            ),
            const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 12),
                child: Icon(Icons.notifications),
              ),
              label: "Activities",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 12),
                child: SvgPicture.asset(
                  AppImages.chat,
                  colorFilter: ColorFilter.mode(
                    indexValue.selectedIndex == 3
                        ? AppColors.darkGreen
                        : AppColors.pastelBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: PopupMenuButton(
                icon: const Icon(Icons.menu),
                surfaceTintColor: AppColors.white,
                shape: TooltipShape(),
                constraints: const BoxConstraints(
                  minWidth: 4.0 * 46.0,
                  maxWidth: 7.0 * 66.0,
                ),
                position: PopupMenuPosition.over,
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      value: 'Add Property',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.propertyType);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            label: 'Add Property',
                            size: FontSize.xxMedium,
                            color: AppColors.darkGreen,
                          ),
                          SvgPicture.asset(
                            AppImages.homeIcon,
                          ),
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: 'My Profile',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.profile);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            label: 'My Profile',
                            size: FontSize.xxMedium,
                            color: AppColors.darkGreen,
                          ),
                          Icon(
                            Icons.person,
                            color: AppColors.darkGreen,
                          ),
                        ],
                      )),
                  PopupMenuItem<String>(
                      value: 'Settings',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.settings);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            label: 'Settings',
                            size: FontSize.xxMedium,
                            color: AppColors.darkGreen,
                          ),
                          Icon(
                            Icons.settings,
                            color: AppColors.darkGreen,
                          ),
                        ],
                      )),
                  const PopupMenuItem<String>(
                      value: 'Get Help',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            label: 'Get Help',
                            size: FontSize.xxMedium,
                            color: AppColors.darkGreen,
                          ),
                          Icon(
                            Icons.help,
                            color: AppColors.darkGreen,
                          ),
                        ],
                      )),
                ],
              ),
              label: "Menu",
            ),
          ],
          currentIndex: indexValue.selectedIndex,
          selectedItemColor: AppColors.darkGreen,
          unselectedItemColor: AppColors.pastelBlue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    ActivitiesScreen(),
    MessageScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 4) {
      _bottomNavigationProvider.selectedIndex = index;
    }
  }
}

class TooltipShape extends ShapeBorder {
  TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(26);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, rrect.height - 10);
    path.quadraticBezierTo(0, rrect.height, 10, rrect.height);
    path.lineTo(rrect.width - 30, rrect.height);
    path.lineTo(rrect.width - 20, rrect.height + 10);
    path.lineTo(rrect.width - 10, rrect.height);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width, rrect.height - 10);
    path.lineTo(rrect.width, 10);
    path.quadraticBezierTo(rrect.width, 0, rrect.width - 10, 0);
    path.lineTo(10, 0);
    path.quadraticBezierTo(0, 0, 0, 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}
