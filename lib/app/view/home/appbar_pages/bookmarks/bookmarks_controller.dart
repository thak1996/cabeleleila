import 'package:cabeleleila/app/services/bookmarks_service.dart';
import 'package:cabeleleila/app/view/home/appbar_pages/bookmarks/bookmarks_state.dart';
import 'package:flutter/material.dart';

class BookmarksController extends ChangeNotifier {
  final BookmarksService _service;
  BookmarksController(this._service);

  BookmarksState _state = BookmarksStateInitial();

  BookmarksState get state => _state;

  void _changeState(BookmarksState newState) {
    _state = newState;
    notifyListeners();
  }

}
