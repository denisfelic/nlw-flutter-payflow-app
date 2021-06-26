import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/divider_widget/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;
  final bool? primaryColor;

  const SetLabelButtons({
    Key? key,
    this.primaryColor,
    required this.primaryLabel,
    required this.primaryOnTap,
    required this.secondaryLabel,
    required this.secondaryOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: AppColors.shape,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              primaryColor: primaryColor,
              label: this.primaryLabel,
              onTap: this.primaryOnTap,
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: this.secondaryLabel,
              onTap: this.secondaryOnTap,
            ),
          ),
        ],
      ),
    );
  }
}
