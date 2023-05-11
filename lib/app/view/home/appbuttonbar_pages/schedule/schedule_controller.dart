import 'package:cabeleleila/app/services/firebase/firebase_cloud_service.dart';
import 'package:cabeleleila/app/services/home_service.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/schedule/schedule_state.dart';
import 'package:flutter/material.dart';

class ScheduleController extends ChangeNotifier {
  ScheduleController(
    FirebaseCloudService firebaseCloudService,
    this.homeService,
  );

  final HomeService homeService;

  ScheduleState _state = ScheduleStateInitial();

  ScheduleState get state => _state;

  Future<void> getClouds({
    required String id,
  }) async {
    _changeState(ScheduleStateLoading());
    try {
      final clouds = await homeService.getClouds(
        id: id,
      );
      _changeState(ScheduleStateSucess(cloud: clouds));
    } catch (e) {
      _changeState(ScheduleStateError(e.toString()));
    }
  }

  void _changeState(ScheduleState newState) {
    _state = newState;
    notifyListeners();
  }
}
