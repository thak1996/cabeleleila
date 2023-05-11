import 'dart:convert';
import 'package:flutter/material.dart';

class BookmarksModel {
  final String id;
  final DateTime date;
  final TimeOfDay time;
  final bool isConfirmed;

  BookmarksModel({
    required this.id,
    required this.date,
    required this.time,
    this.isConfirmed = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientName': id,
      'dateTime': date.toString(),
      'time': '${time.hour}:${time.minute}',
      'isConfirmed': isConfirmed,
    };
  }

  factory BookmarksModel.fromMap(Map<String, dynamic> map) {
    return BookmarksModel(
      id: map['id'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      time: TimeOfDay(hour: map['hour'], minute: map['minute']),
      isConfirmed: map['isConfirmed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  TimeOfDay fromString(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];
    return TimeOfDay(
      hour: hh + int.parse(time.split(":")[0]) % 24,
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }

  // Método para converter um objeto TimeOfDay em uma String
  String timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Método para converter uma String em um objeto TimeOfDay
  TimeOfDay stringToTimeOfDay(String value) {
    final parts = value.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  factory BookmarksModel.fromJson(String source) =>
      BookmarksModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
