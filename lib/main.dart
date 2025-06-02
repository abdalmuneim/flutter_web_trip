import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/trips_screen.dart';
import 'core/resources/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Trips',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            primaryColor: AppColors.instance.primary,
            scaffoldBackgroundColor: const Color(0xFF121212),
            colorScheme: ColorScheme.dark(
              primary: AppColors.instance.primary,
              secondary: AppColors.instance.blueAccent,
              surface: const Color(0xFF1E1E1E),
              error: Colors.red[400]!,
            ),
            cardTheme: CardTheme(
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            useMaterial3: true,
            tabBarTheme: TabBarTheme(
              labelStyle: GoogleFonts.inter(fontWeight: FontWeight.normal),

              unselectedLabelStyle: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
              ),
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          home: const TripsScreen(),
        );
      },
    );
  }
}
