import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class RecipeDialogUser extends StatefulWidget {
  const RecipeDialogUser({
    super.key,
    required this.mealInstructions,
    required this.mealIngredientsAndMeasurements,
    required this.mealName,
  });

  final String mealInstructions;
  final String mealIngredientsAndMeasurements;
  final String mealName;

  @override
  State<RecipeDialogUser> createState() => _RecipeDialogUserState();
}

class _RecipeDialogUserState extends State<RecipeDialogUser> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Text(
            widget.mealName,
            style: AppTextStyles.small16w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients and Measurements',
                  style: AppTextStyles.medium24w700
                      .apply(color: AppColors.neutral90),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Text(
                  widget.mealIngredientsAndMeasurements.toString(),
                  style: AppTextStyles.small14w400
                      .apply(color: AppColors.neutral90),
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                Text(
                  'Instructions',
                  style: AppTextStyles.medium24w700
                      .apply(color: AppColors.neutral90),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Text(
                  widget.mealInstructions.toString(),
                  style: AppTextStyles.small14w400
                      .apply(color: AppColors.neutral90),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: const BoxDecoration(color: AppColors.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                color: AppColors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
