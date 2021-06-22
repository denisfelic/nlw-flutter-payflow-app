import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Container(
                color: AppColors.primary,
                width: double.infinity,
                height: 400,
              ),
              Container(
                color: AppColors.background,
                width: double.infinity,
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 40)),
                Image.asset(AppImages.person),
                Padding(padding: EdgeInsets.only(top: 10)),
                Image.asset(AppImages.logomini),
                // Title container
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Organize seus\n boletos em um\n só lugar",
                    style: AppTextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Button
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                    padding: EdgeInsets.all(5),
                    color: AppColors.stroke,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset(AppImages.google),
                        ),
                        Text(
                          "Entrar com Google",
                          style: AppTextStyles.buttonGray,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    print("oi");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
