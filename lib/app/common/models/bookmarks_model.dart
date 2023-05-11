import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarksModel {
  BookmarksModel({
    this.id,
    this.dateTime,
    this.serviceSalon,
    this.name,
  });

  factory BookmarksModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BookmarksModel(
      id: data?['id'],
      dateTime: data?['dateTime'],
      serviceSalon: data?['serviceSalon'],
      name: data?['name'],
    );
  }

  factory BookmarksModel.fromJson(String source) =>
      BookmarksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory BookmarksModel.fromMap(Map<String, dynamic> map) {
    return BookmarksModel(
      id: map['id'] != null ? map['id'] as String : null,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      serviceSalon:
          map['serviceSalon'] != null ? map['serviceSalon'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  DateTime? dateTime;
  String? id;
  String? name;
  String? serviceSalon;

  @override
  bool operator ==(covariant BookmarksModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dateTime == dateTime &&
        other.serviceSalon == serviceSalon &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateTime.hashCode ^
        serviceSalon.hashCode ^
        name.hashCode;
  }

  @override
  String toString() {
    return 'BookmarksModel(id: $id, dateTime: $dateTime, serviceSalon: $serviceSalon, name: $name)';
  }

  BookmarksModel copyWith({
    String? id,
    DateTime? dateTime,
    String? serviceSalon,
    String? name,
  }) {
    return BookmarksModel(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      serviceSalon: serviceSalon ?? this.serviceSalon,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateTime': dateTime.toString(),
      'serviceSalon': serviceSalon,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (dateTime != null) "dateTime": dateTime,
      if (serviceSalon != null) "serviceSalon": serviceSalon,
      if (name != null) "name": name,
    };
  }
}
