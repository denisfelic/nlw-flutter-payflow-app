import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/model/user_model.dart';

import 'auth_controller.dart';

/// Class to handle the [google sign in]
class GoogleLoginController {
  final _authController = AuthController();
  final BuildContext context;

  GoogleLoginController(this.context);

  /// Get [email] from [google sign in]
  /// Set user to be the [email] and set as a logged [user]
  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );
      this._authController.setLoggedUser(context, user);
    } catch (error) {
      print(error);
      this._authController.setLoggedUser(context, null);
    }
  }

  Future<void> googleSignOut() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
    try {
      final response = await _googleSignIn.signOut();
      this._authController.logout(context);

      print("Logout");
      print(response.toString());
    } catch (error) {
      print(error);
    }
  }
}
