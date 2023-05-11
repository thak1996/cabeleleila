import 'package:cabeleleila/app/common/utils/date_time_helper.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_state.dart';
import 'package:flutter/material.dart';

class BookmarksController extends ChangeNotifier {
  final ValueNotifier<String> dateValueNotifier = ValueNotifier(
    DateTimeHelper().getData(DateTime.now()),
  );

  final ValueNotifier<String> timeValueNotifier = ValueNotifier(
    DateTimeHelper().getTime(TimeOfDay.now()),
  );

  late final DateTime _selectedDate;
  late final TimeOfDay _selectedTime;
  BookmarksState _state = BookmarksStateInitial();

  BookmarksState get state => _state;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      dateValueNotifier.value = DateTimeHelper().getData(picked);
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      timeValueNotifier.value = DateTimeHelper().getTime(picked);
    }
  }

  void _changeState(BookmarksState newState) {
    _state = newState;
    notifyListeners();
  }
}
