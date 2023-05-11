import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  String timeOfDayToString(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

String formatDate(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

String formatTime(DateTime time) {
  final formatter = DateFormat('HH:mm');
  return formatter.format(time);
}

String formatDateTime(DateTime dateTime) {
  final formattedDate = formatDate(dateTime);
  final formattedTime = formatTime(dateTime);
  return '$formattedDate às $formattedTime';
}

class DateTimeFormatter {
  static String format(DateTime dateTime,
      {String dateFormat = 'dd/MM/yyyy', String timeFormat = 'HH:mm'}) {
    final formattedDate = DateFormat(dateFormat).format(dateTime);
    final formattedTime = DateFormat(timeFormat).format(dateTime);
    return '$formattedDate às $formattedTime';
  }
}

String capitalizeOne(String s) =>
    s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : '';

String capitalizeMult(String text) {
  if (text.isEmpty) {
    return text;
  }

  List<String> words = text.split(" ");
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.length > 1) {
      words[i] =
          word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
    } else {
      words[i] = word.toUpperCase();
    }
  }

  return words.join(" ");
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
