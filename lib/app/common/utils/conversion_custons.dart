import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String timeOfDayToString(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class DateTimeHelper {
  String getData(DateTime? date) {
    if (date == null) {
      return "";
    }
    final result =
        '${_formatNumber(date.day)}/${_formatNumber(date.month)}/${date.year}';
    return result;
  }

  String getTime(TimeOfDay? time) {
    if (time == null) {
      return "";
    }
    final result = '${_formatNumber(time.hour)}:${_formatNumber(time.minute)}';
    return result;
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }
}
