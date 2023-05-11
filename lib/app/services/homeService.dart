import 'package:cabeleleila/app/common/models/bookmarks_model.dart';

abstract class HomeService {
  Future<BookmarksModel> postCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  });

  Future<BookmarksModel> getCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  });
}
