import 'package:intl/intl.dart';

class ForamtDates {
  static ForamtDates? _instance;
  // Avoid self instance
  ForamtDates._();
  static ForamtDates get instance => _instance ??= ForamtDates._();

  String formatDateRange(String? start, String? end) {
    if (start == null || end == null) return '';

    try {
      final startDate = DateFormat('dd-MM-yyyy').parse(start);
      final endDate = DateFormat('dd-MM-yyyy').parse(end);

      final startFormatted = DateFormat('MMM d').format(startDate);
      final endFormatted = DateFormat('MMM d').format(endDate);
      final year = DateFormat('yyyy').format(endDate);

      // Calculate number of nights
      final nights = endDate.difference(startDate).inDays;

      return '$nights Nights ($startFormatted - $endFormatted, $year)';
    } catch (e) {
      return '$start - $end';
    }
  }
}
