import 'dart:convert';

// Data Model
class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, this.photoURL});

  /// Convert string to object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map["name"], photoURL: map["photoURL"]);
  }

  /// Convert json to object
  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  /// Convert the dart class to object map
  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  /// Convert in json
  String toJson() => jsonEncode(toMap());
}
