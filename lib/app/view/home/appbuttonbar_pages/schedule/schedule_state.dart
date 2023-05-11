// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cabeleleila/app/common/models/bookmarks_model.dart';

abstract class ScheduleState {}

class ScheduleStateInitial extends ScheduleState {}

class ScheduleStateLoading extends ScheduleState {}

class ScheduleStateSucess implements ScheduleState {
  const ScheduleStateSucess({
    required this.cloud,
  });

  final List<BookmarksModel> cloud;
}

class ScheduleStateError extends ScheduleState {
  ScheduleStateError(this.message);

  final String message;
}
