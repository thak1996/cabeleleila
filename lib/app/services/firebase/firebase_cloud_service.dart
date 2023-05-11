import 'package:cabeleleila/app/common/models/bookmarks_model.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/services/homeService.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService implements HomeService {
  final _auth = FirebaseAuth.instance;
  final _controller = locator.get<BookmarksController>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<BookmarksModel> getCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  }) async {
    // TODO: implement getCloud
    throw UnimplementedError();
  }

  @override
  Future<BookmarksModel> postCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  }) async {
    try {
      final result = await _db
          .collection("agenda")
          .doc(_auth.currentUser?.uid)
          .collection(_auth.currentUser!.email!)
          .add(BookmarksModel().toMap());
      if (result.id != "") {
        DateTime value = _controller.formatDateTime(
          _controller.getSelectedDate(),
          _controller.getSelectedTime(),
        );
        return BookmarksModel(
            id: _auth.currentUser?.uid,
            dateTime: value,
            serviceSalon: _controller.dropValueNotifier.value,
            name: _auth.currentUser?.displayName);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }
}
