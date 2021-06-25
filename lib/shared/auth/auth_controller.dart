import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  /// [!]: Callable only if is not null
  UserModel get user => _user!;

  /// Save  the user to [sharedPreferences] and redirect to [/home]
  /// If user is [Null] then redirect to [/login]
  void setLoggedUser(BuildContext context, UserModel? user) {
    if (user == null) {
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }
    this._user = user;
    this.saveUser(this.user);

    /// Redirect, "Replacement" remove "back" to last screen button
    Navigator.pushReplacementNamed(context, '/home');
  }

  /// Save the user to the [shared preferences] of device
  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  /// Check if user is already in [shared preferences]
  /// if is [Null], redirect to [/login] page
  /// If isen't [Null], then set as Logged user and redirect to [/home]
  Future<void> hasCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(milliseconds: 500));

    /// If user does not exist in [shared preferences]
    if (!instance.containsKey("user")) {
      setLoggedUser(context, null);
      return;
    }

    /// User exist, set to logged and redirect to home page
    final userJson = instance.get("user") as String;
    setLoggedUser(context, UserModel.fromJson(userJson));
    return;
  }

  Future<void> logout(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      await instance.remove("user");
      this.setLoggedUser(context, null);
    }
  }
}
