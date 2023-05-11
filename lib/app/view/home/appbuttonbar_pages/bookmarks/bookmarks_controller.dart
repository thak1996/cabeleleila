import 'package:cabeleleila/app/common/utils/conversion_custons.dart';
import 'package:cabeleleila/app/services/firebase/firebase_cloud_service.dart';
import 'package:cabeleleila/app/services/home_service.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookmarksController extends ChangeNotifier {
  BookmarksController(this.homeService, FirebaseCloudService firebaseCloudService,);

  final ValueNotifier<String> dateValueNotifier = ValueNotifier(
    DateTimeHelper().getData(DateTime.now()),
  );

  final ValueNotifier<String> dropValueNotifier =
      ValueNotifier('Corte de Cabelo');

  final HomeService homeService;
  final List<String> options = [
    'Corte de Cabelo',
    'Coloração de Cabelo',
    'Tratamentos Capilares',
    'Manicure e Pedicure',
    'Maquiagem',
    'Depilação',
    'Design de Sobrancelhas',
    'Tratamentos Faciais',
    'Massagem Corporal'
  ];

  final ValueNotifier<String> timeValueNotifier = ValueNotifier(
    DateTimeHelper().getTime(TimeOfDay.now()),
  );

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  BookmarksState _state = BookmarksStateInitial();

  BookmarksState get state => _state;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      dateValueNotifier.value = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      _selectedTime = picked;
      String result = picked.timeOfDayToString(picked);
      timeValueNotifier.value = result;
    }
  }

  formatDateTime(DateTime date, TimeOfDay time) =>
      DateTime(date.year, date.month, date.day, time.hour, time.minute);

  DateTime getSelectedDate() => _selectedDate;

  TimeOfDay getSelectedTime() => _selectedTime;

  Future<void> postCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  }) async {
    _changeState(BookmarksStateLoading());
    try {
      await homeService.postCloud(
        id: id,
        dateTime: dateTime,
        serviceSalon: serviceSalon,
        name: name,
      );
      _changeState(BookmarksStateSucess());
    } catch (e) {
      _changeState(BookmarksStateError(e.toString()));
    }
  }

  void _changeState(BookmarksState newState) {
    _state = newState;
    notifyListeners();
  }
}
