import 'dart:convert';

class BookmarksModel {
  String? id;
  DateTime? dateTime;
  String? serviceSalon;
  String? name;
  BookmarksModel({
    this.id,
    this.dateTime,
    this.serviceSalon,
    this.name,
  });
  

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
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'serviceSalon': serviceSalon,
      'name': name,
    };
  }

  factory BookmarksModel.fromMap(Map<String, dynamic> map) {
    return BookmarksModel(
      id: map['id'] != null ? map['id'] as String : null,
      dateTime: map['dateTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int) : null,
      serviceSalon: map['serviceSalon'] != null ? map['serviceSalon'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookmarksModel.fromJson(String source) => BookmarksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookmarksModel(id: $id, dateTime: $dateTime, serviceSalon: $serviceSalon, name: $name)';
  }

  @override
  bool operator ==(covariant BookmarksModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
}
