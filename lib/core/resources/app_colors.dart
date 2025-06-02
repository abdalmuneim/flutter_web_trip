import 'dart:ui';

class AppColors {
  static AppColors? _instance;
  // Avoid self instance
  AppColors._();
  static AppColors get instance => _instance ??= AppColors._();

  Color get primary => const Color(0xFFFFC268);
  Color get grey => const Color(0xFF999999);
  Color get greyLight => const Color(0xFFD9D9D9);
  Color get blackLight1 => const Color(0xFF262626);
  Color get blackLight2 => const Color(0xFF171717);
  Color get red => const Color(0xFFC25F30);
  Color get blueAccent => const Color(0xFF33BFED);
}
