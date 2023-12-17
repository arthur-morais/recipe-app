import 'package:flutter/material.dart';
import 'package:recipes/constants/text_styles.dart';

class BistekCard extends StatefulWidget {
  const BistekCard({super.key});

  @override
  State<BistekCard> createState() => _BistekCardState();
}

class _BistekCardState extends State<BistekCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bistek_image.jpg',
                width: screenWidth * 0.8,
              ),
              Container(
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Text(
                  'Bistek',
                  style: AppTextStyles.big42w700,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
