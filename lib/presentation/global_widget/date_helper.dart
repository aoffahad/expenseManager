import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateHelpers {
  DateHelpers._();

  static void selectDate(BuildContext context, WidgetRef ref, dynamic provider,
      {DateTime? startDate, DateTime? endDate, DateTime? initialDate}) async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now().subtract(const Duration(days: 93)),
      lastDate: endDate ?? DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFFD50000),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Color(0xFFD50000))
                .copyWith(secondary: const Color(0xFFD50000)),
          ),
          child: child!,
        );
      },
    );

    if (pickDate != null) {
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(pickDate); // Format date
      ref.read(provider.notifier).state = formattedDate;
    }
  }
}
