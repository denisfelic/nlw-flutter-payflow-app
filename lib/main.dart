import 'package:flutter/material.dart';
import 'package:payflow/modules/login/LoginPage.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/themes/appcolors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: LoginPage(),
    );
  }
}
