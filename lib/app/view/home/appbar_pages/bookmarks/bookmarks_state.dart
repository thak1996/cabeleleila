abstract class BookmarksState {}

class BookmarksStateInitial extends BookmarksState {}

class BookmarksStateLoading extends BookmarksState {}

class BookmarksStateSucess extends BookmarksState {}

class BookmarksStateError extends BookmarksState {
  final String message;
  BookmarksStateError(this.message);
}
