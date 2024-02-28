import 'package:infinimesh_timeseries_app/app/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Infinimesh Timeseries",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.DARK_COLOR,
        colorScheme: const ColorScheme.dark(
          primary: AppColor.PRIMARY_COLOR,
          secondary: AppColor.SECONDARY_COLOR,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: (context.isTablet)
                ? const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  )
                : const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
            backgroundColor: AppColor.PRIMARY_COLOR,
            foregroundColor: AppColor.LIGHT_COLOR,
            disabledBackgroundColor: AppColor.DISABLED_COLOR,
            disabledForegroundColor: Colors.grey[500],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColor.DARK_COLOR,
              width: 1.0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        toggleButtonsTheme: const ToggleButtonsThemeData(
          color: AppColor.DARK_COLOR,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          tilePadding: EdgeInsets.only(left: 10),
          expandedAlignment: Alignment.centerLeft,
          iconColor: AppColor.LIGHT_COLOR,
          childrenPadding: EdgeInsets.only(left: 10, right: 40),
          collapsedIconColor: AppColor.LIGHT_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 24 : 20,
            fontWeight: FontWeight.w500,
            color: AppColor.LIGHT_COLOR,
          ),
          titleMedium: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 20 : 16,
            fontWeight: FontWeight.w400,
            color: AppColor.LIGHT_COLOR,
          ),
          titleSmall: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 16 : 12,
            fontWeight: FontWeight.normal,
            color: AppColor.LIGHT_COLOR,
          ),
          bodyLarge: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 16 : 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 14 : 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 12 : 10,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          labelLarge: GoogleFonts.exo2(
            fontSize: (context.isTablet) ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
