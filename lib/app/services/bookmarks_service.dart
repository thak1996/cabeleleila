import 'package:cabeleleila/app/common/models/bookmarks_model.dart';
import 'package:flutter/material.dart';

abstract class BookmarksService {
  Future<BookmarksModel?> selectDate({required DateTime? date});
  Future<BookmarksModel?> selectTime({required TimeOfDay? timeOfDay});
}
