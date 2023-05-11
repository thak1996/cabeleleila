abstract class BookmarksState {}

class BookmarksStateInitial extends BookmarksState {}

class BookmarksStateLoading extends BookmarksState {}

class BookmarksStateSucess extends BookmarksState {}

class BookmarksStateError extends BookmarksState {
  BookmarksStateError(this.message);

  final String message;
}
