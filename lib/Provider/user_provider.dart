import 'dart:convert';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserProfile userProfileFromMap(Map<String, dynamic> map) {
  final sub = map['sub'] as String? ?? '';
  final name = map['name'] as String?;
  final givenName = map['given_name'] as String?;
  final familyName = map['family_name'] as String?;
  final middleName = map['middle_name'] as String?;
  final nickname = map['nickname'] as String?;
  final preferredUsername = map['preferred_username'] as String?;
  final profileUrlString = map['profile'] as String?;
  final profileUrl =
      profileUrlString != null ? Uri.parse(profileUrlString) : null;
  final pictureUrlString = map['picture'] as String?;
  final pictureUrl =
      pictureUrlString != null ? Uri.parse(pictureUrlString) : null;
  final websiteUrlString = map['website'] as String?;
  final websiteUrl =
      websiteUrlString != null ? Uri.parse(websiteUrlString) : null;
  final email = map['email'] as String?;
  final isEmailVerified = map['email_verified'] as bool?;
  final gender = map['gender'] as String?;
  final birthdate = map['birthdate'] as String?;
  final zoneinfo = map['zoneinfo'] as String?;
  final locale = map['locale'] as String?;
  final phoneNumber = map['phone_number'] as String?;
  final isPhoneNumberVerified = map['phone_number_verified'] as bool?;
  final addressMap = map['address'] as Map<String, dynamic>?;
  final address = addressMap != null
      ? Map<String, String>.from(addressMap.cast<String, String>())
      : null;
  final updatedAtString = map['updated_at'] as String?;
  final updatedAt =
      updatedAtString != null ? DateTime.parse(updatedAtString) : null;
  final customClaimsMap = map['custom_claims'] as Map<String, dynamic>?;
  final customClaims = customClaimsMap != null
      ? Map<String, dynamic>.from(customClaimsMap.cast<String, dynamic>())
      : null;

  return UserProfile(
    sub: sub,
    name: name,
    givenName: givenName,
    familyName: familyName,
    middleName: middleName,
    nickname: nickname,
    preferredUsername: preferredUsername,
    profileUrl: profileUrl,
    pictureUrl: pictureUrl,
    websiteUrl: websiteUrl,
    email: email,
    isEmailVerified: isEmailVerified,
    gender: gender,
    birthdate: birthdate,
    zoneinfo: zoneinfo,
    locale: locale,
    phoneNumber: phoneNumber,
    isPhoneNumberVerified: isPhoneNumberVerified,
    address: address,
    updatedAt: updatedAt,
    customClaims: customClaims,
  );
}

Credentials credentialsFromMap(Map<dynamic, dynamic> map) {
  final idToken = map['idToken'] as String? ?? '';
  final accessToken = map['accessToken'] as String? ?? '';
  final refreshToken = map['refreshToken'] as String?;
  final expiresAtString = map['expiresAt'] as String?;
  final expiresAt = expiresAtString != null
      ? DateTime.parse(expiresAtString)
      : DateTime.now();
  final scopes = (map['scopes'] as List).cast<String>().toSet();
  final userMap = map['userProfile'] as Map<String, dynamic>? ?? {};
  final user = userProfileFromMap(userMap);
  final tokenType = map['tokenType'] as String? ?? '';

  return Credentials(
    idToken: idToken,
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresAt: expiresAt,
    scopes: scopes,
    user: user,
    tokenType: tokenType,
  );
}

Future<Credentials?> getUserFromStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString("userData");

  if (userData != null) {
    final decodedData = json.decode(userData);

    if (decodedData is Map<dynamic, dynamic>) {
      final credentials = credentialsFromMap(decodedData);
      return credentials;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Credentials?>((ref) {
  final userFuture = getUserFromStorage();
  return UserNotifier(userFuture);
});

class UserNotifier extends StateNotifier<Credentials?> {
  UserNotifier(Future<Credentials?> userFuture) : super(null) {
    _loadUserFromSharedPreferences(userFuture);
  }

  Future<void> _loadUserFromSharedPreferences(
      Future<Credentials?> userFuture) async {
    final user = await userFuture;
    state = user;
  }

  void deleteUser() {
    state = null;
    _removeUserFromSharedPreferences();
  }

  void _saveUserToSharedPreferences(Credentials user) async {
    final prefs = await SharedPreferences.getInstance();
    final userMap = user.toMap(); // Convert Credentials object to a map
    prefs.setString("userData", json.encode(userMap));
  }

  void _removeUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("userData");
  }

  void updateUser(Credentials u) {
    state = u;
    _saveUserToSharedPreferences(u);
  }
}
