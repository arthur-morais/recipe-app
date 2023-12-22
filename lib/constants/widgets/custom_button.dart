import 'package:flutter/material.dart';
import 'package:recipes/constants/text_styles.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    this.onPressed,
  });

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        iconColor: MaterialStateProperty.all<Color>(AppColors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? Icon(icon) : Container(),
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Text(
            buttonText,
            style: AppTextStyles.small16w700.apply(color: textColor),
          ),
        ],
      ),
    );
  }
}
