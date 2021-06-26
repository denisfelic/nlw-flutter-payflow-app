import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final SetLabelButtons setLabelButtons;

  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.setLabelButtons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      color: AppColors.background,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.buttonBoldHeading,
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.buttonHeading,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            child: Divider(
              color: AppColors.stroke,
              thickness: 1,
            ),
          ),
          setLabelButtons,
        ],
      ),
    );
  }
}
