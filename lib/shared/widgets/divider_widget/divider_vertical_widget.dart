import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.stroke,
      width: 1,
      height: double.maxFinite,
    );
  }
}
