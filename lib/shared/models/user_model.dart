import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));


}
