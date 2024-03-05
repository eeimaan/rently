import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_fix/constants/app_colors.dart';
import 'package:rent_fix/constants/constants.dart';
import 'package:rent_fix/firebase_options.dart';
import 'package:rent_fix/providers/providers.dart';
import 'package:rent_fix/widgets/widgets.dart';

// DevicePreview(  builder: (context) => const RentFixApp(), ),
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RentFixApp());
}

class RentFixApp extends StatelessWidget {
  const RentFixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<SelectedBorderProvider>(
          create: (context) => SelectedBorderProvider(),
        ),
        ChangeNotifierProvider<PropertyProvider>(
          create: (context) => PropertyProvider(),
        ),
        ChangeNotifierProvider<BedroomProvider>(
          create: (context) => BedroomProvider(),
        ),
        ChangeNotifierProvider<BathroomProvider>(
          create: (context) => BathroomProvider(),
        ),
        ChangeNotifierProvider<ImagePickerProvider>(
          create: (context) => ImagePickerProvider(),
        ),
        ChangeNotifierProvider<OfferModelProvider>(
          create: (context) => OfferModelProvider(),
        ),
        ChangeNotifierProvider<DrawingRoomProvider>(
          create: (context) => DrawingRoomProvider(),
        ),
        ChangeNotifierProvider<TvlaunchProvider>(
          create: (context) => TvlaunchProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.paleSkyBlue,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
          ),
        ),
        // home: const ActivitiesScreen(),
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
