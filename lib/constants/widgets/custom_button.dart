import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.buttonColor,
  });

  final String buttonText;
  final Color buttonColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        iconColor: MaterialStateProperty.all<Color>(AppColors.white),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Text(
            buttonText,
            style: const TextStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}