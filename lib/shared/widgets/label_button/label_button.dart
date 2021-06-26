import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class LabelButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool? primaryColor;

  const LabelButton(
      {Key? key, this.primaryColor, required this.label, required this.onTap})
      : super(key: key);

  @override
  _LabelButtonState createState() =>
      _LabelButtonState(label, onTap, primaryColor);
}

class _LabelButtonState extends State<LabelButton> {
  final String _label;
  final VoidCallback _onTap;

  bool? _primaryColor;

  _LabelButtonState(this._label, this._onTap, this._primaryColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: TextButton(
        onPressed: _onTap,
        child: Text(_label,
            style: this._primaryColor == true
                ? AppTextStyles.buttonPrimary
                : AppTextStyles.buttonHeading),
      ),
    );
  }
}
