import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/widget/eleveted_button_custon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

String _formatNumber(int number) {
  return number.toString().padLeft(2, '0');
}

class _BookMarksPageState extends State<BookMarksPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String data = '';
  String tempo = '';

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        // Formatting date
        data =
            '${picked.year}-${_formatNumber(picked.month)}-${_formatNumber(picked.day)}';
        _selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        // Formatting time
        tempo =
            '${_formatNumber(picked.hour)}:${_formatNumber(picked.minute)}';
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCalendarPage(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data selecionada: $data',
            ),
            CustomElevatedButton(
              text: 'Selecionar Data',
              onPressed: () => _selectDate(),
            ),
            const SizedBox(height: 24),
            Text(
              'Horário selecionado: $tempo',
            ),
            CustomElevatedButton(
              text: 'Selecionar horário',
              onPressed: () => _selectTime(),
            ),
            const SizedBox(height: 24),
            Text(
              'Data e horário selecionados: ${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year} às ${_selectedTime.hour}:${_selectedTime.minute}',
            ),
          ],
        ),
      ),
    );
  }

  AppBarCustom appBarCalendarPage() => const AppBarCustom(title: 'Agendamento');
}
