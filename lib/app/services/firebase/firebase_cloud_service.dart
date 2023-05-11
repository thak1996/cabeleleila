import 'package:cabeleleila/app/common/models/bookmarks_model.dart';
import 'package:cabeleleila/app/services/home_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService implements HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<BookmarksModel>> getClouds({
    required String id,
  }) async {
    final agenda = await _db.collection(id).get();
    final result = agenda.docChanges
        .map(
          (e) => BookmarksModel(
            id: e.doc['id'],
            dateTime: DateTime.parse(e.doc['dateTime']),
            serviceSalon: e.doc['serviceSalon'],
            name: e.doc['name'],
          ),
        )
        .toList();
    return result;
  }

  @override
  Future<BookmarksModel> postCloud({
    required String id,
    required DateTime dateTime,
    required String serviceSalon,
    required String name,
  }) async {
    try {
      final result = await _db.collection(id).add(BookmarksModel(
            id: id,
            dateTime: dateTime,
            serviceSalon: serviceSalon,
            name: name,
          ).toMap());
      if (result.id != "") {
        return BookmarksModel(
          id: id,
          dateTime: dateTime,
          serviceSalon: serviceSalon,
          name: name,
        );
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
