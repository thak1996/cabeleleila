import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  final String? email;
  final String? id;
  final String? name;
  final String? password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
