import 'dart:convert';

class UserData {
  final String name;
  final String tokenId;
  final String weight;
  final String height;
  final String gender;

  UserData(
      {required this.height,
      required this.name,
      required this.tokenId,
      required this.weight,
      required this.gender});

  factory UserData.fromJson(String savedUserJson) {
    final Map<String, dynamic> jsonMap = json.decode(savedUserJson);
    return UserData(
        height: jsonMap['height'],
        name: jsonMap['name'],
        tokenId: jsonMap['tokenId'],
        weight: jsonMap['weight'],
        gender: jsonMap["gender"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'name': name,
      'tokenId': tokenId,
      'weight': weight,
      'gender': gender
    };
  }
}
