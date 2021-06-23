import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: AppColors.background,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              width: screenSize.width,
              height: screenSize.height * 0.36,
            ),
            Positioned(
              top: 67,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 373,
              ),
            ),
            Positioned(
              bottom: screenSize.height * -0.04,
              left: 0,
              right: 0,
              child: Container(
                height: screenSize.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Image.asset(AppImages.logomini),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 110, right: 110, top: 24),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleHome,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 24),
                      child: SocialLoginButton(
                        onTap: () {
                          // TODO: Implementar login social
                          print("Olá ");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
