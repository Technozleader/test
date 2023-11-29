import 'package:intl/intl.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/service_locator.dart';

extension DateTimeFormatter on DateTime {
  String get formatToMDYYYYY => DateFormat('M/d/yyyy').format(this);
  String get formatToyDDMMMYYYY => DateFormat.yMMMd().format(this);
  String get formatToHHmmAMPM => DateFormat('hh:mm a').format(this);

  int get calculateDifference => difference(DateTime.now()).inDays;
}

extension StringFormatter on String? {
  String get formatCurrency {
    final language = getIt<AppManagerCubit>().locale.languageCode;
    final price = double.tryParse(this ?? '');
    if (this == null || price == null) {
      return language == 'en' ? '0.00 SAR' : '0.0 ريال';
    }
    return NumberFormat.compactCurrency(
      name: 'SAR ',
      locale: language,
    ).format(double.parse(this!));
  }
}

extension StringExtension on String {
  String capitalize() {
    return length <= 2
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
