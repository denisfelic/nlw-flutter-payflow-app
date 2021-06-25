import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    authController.hasCurrentUser(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(AppImages.union),
            Image.asset(AppImages.logoFull),
          ],
        ),
      ),
    );
  }
}
