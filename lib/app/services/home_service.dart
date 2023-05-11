import 'package:cabeleleila/app/common/models/bookmarks_model.dart';

abstract class HomeService {
  Future<BookmarksModel> postCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  });

  Future<List<BookmarksModel>> getClouds({
    required String id,
  });
}
