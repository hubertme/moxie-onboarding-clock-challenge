import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/constants/design_size.dart';
import 'package:onboarding_clock_challenge/my_home_page.dart';
import 'package:onboarding_clock_challenge/providers/alarm_provider.dart';
import 'package:onboarding_clock_challenge/screens/main_clock/main_clock_screen.dart';
import 'package:provider/provider.dart';

class OnboardingClockApp extends StatelessWidget {
  MaterialColor _buildMaterialColor(Color color) {
    final Map<int, Color> swatch = {
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    };

    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AlarmProvider()),
      ],
      child: ScreenUtilInit(
          designSize: Size(DesignSize.WIDTH, DesignSize.HEIGHT), // Refers to iPhone X screen
          allowFontScaling: false,
          builder: () => MaterialApp(
            title: 'Onboarding Clock App',
            theme: ThemeData(
              primarySwatch: this._buildMaterialColor(AppColors.PURPLE),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainClockScreen(),
          )
      ),
    );
  }
}