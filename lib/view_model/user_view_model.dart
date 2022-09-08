import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  /// control User View model logic
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setString("token", user.token!);
    notifyListeners();
    return status;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? currentUserToken = preferences.getString("token");
    return UserModel(token: currentUserToken);
  }

  Future<bool> remove() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("token");
    bool status = await preferences.clear();
    notifyListeners();
    return status;
  }
}
