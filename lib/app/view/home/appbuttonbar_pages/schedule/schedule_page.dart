import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        title: 'Lista de Agendamentos',
      ),
      body: Center(
        child: Text(
          "Schedule",
        ),
      ),
    );
  }
}
