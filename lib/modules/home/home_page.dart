import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/auth/google_login_controller.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pages = [
    Container(color: Colors.blue[150]),
    Container(color: Colors.red[150]),
  ];

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "Denis",
                          style: AppTextStyles.titleBoldBackground),
                    ]),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPageIndex],
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Container _getBottomNavigationBar() {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              homeController.setCurrentPage(0);
              print(homeController.currentPageIndex);

              setState(() {});
            },
            icon: Icon(Icons.home),
            color: AppColors.primary,
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                print('object');
              },
              icon: Icon(Icons.add_box_outlined),
              color: AppColors.background,
            ),
          ),
          IconButton(
            onPressed: () {
              homeController.setCurrentPage(1);
              Navigator.pushNamed(context, "/barcode");
              setState(() {});
            },
            icon: Icon(Icons.description_outlined),
            color: AppColors.body,
          )
        ],
      ),
    );
  }
}
