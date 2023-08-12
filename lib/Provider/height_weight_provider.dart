import 'dart:convert';

import 'package:doctu/Models/user.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData?> getUserFromStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString("personalData");

  if (userData != null) {
    final decodedData = json.decode(userData);
    final jsonString = json.encode(decodedData);
    return UserData.fromJson(jsonString);
  } else {
    return null;
  }
}

final userDataProvider =
    StateNotifierProvider<UserDataNotifier, UserData?>((ref) {
  final userFuture = getUserFromStorage();
  return UserDataNotifier(userFuture);
});

class UserDataNotifier extends StateNotifier<UserData?> {
  UserDataNotifier(Future<UserData?> userFuture) : super(null) {
    _loadUserFromSharedPreferences(userFuture);
  }

  Future<void> _loadUserFromSharedPreferences(
      Future<UserData?> userFuture) async {
    final user = await userFuture;
    state = user;
  }

  void updateUser(UserData u) {
    state = u;
    _saveUserToSharedPreferences(u);
  }

  void deleteUser() {
    state = null;
    _removeUserFromSharedPreferences();
  }

  void _saveUserToSharedPreferences(UserData user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("personalData", json.encode(user));
  }

  void _removeUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("personalData");
  }
}
