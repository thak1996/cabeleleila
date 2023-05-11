import 'package:cabeleleila/app/common/utils/conversion_custons.dart';
import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/widget/card_custom_schedule.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/schedule/schedule_controller.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/schedule/schedule_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _controller = locator.get<ScheduleController>();

  @override
  void initState() {
    _controller.getClouds(id: _auth.currentUser!.uid);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const AppBarCustom(title: 'Lista de Clientes'),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final state = _controller.state;
          if (state is ScheduleStateSucess) {
            final item = state.cloud;
            return ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final cloud = item[index];
                final date = formatDate(cloud.dateTime!);
                final time = formatTime(cloud.dateTime!);
                return CustomCard(
                  clientName: capitalizeMult(cloud.name ?? ""),
                  date: 'Data: $date',
                  serviceName: capitalizeMult(cloud.serviceSalon ?? ""),
                  time: 'Horário: $time',
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
