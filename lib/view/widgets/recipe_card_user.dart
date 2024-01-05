import 'package:flutter/material.dart';
import 'package:recipes/constants/text_styles.dart';
import 'package:recipes/view/widgets/recipe_dialog_user.dart';

import '../../constants/colors.dart';

class RecipeCardUser extends StatefulWidget {
  const RecipeCardUser({
    super.key,
    required this.name,
    required this.ingredientsAndMeasurements,
    required this.thumbnailUrl,
    required this.instructions,
    required this.description,
    required this.id,
  });

  final int id;
  final String name;
  final String ingredientsAndMeasurements;
  final String thumbnailUrl;
  final String instructions;
  final String description;

  @override
  State<RecipeCardUser> createState() => _RecipeCardUserState();
}

class _RecipeCardUserState extends State<RecipeCardUser> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return RecipeDialogUser(
              id: widget.id,
              mealInstructions: widget.instructions,
              mealIngredientsAndMeasurements: widget.ingredientsAndMeasurements,
              mealName: widget.name,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.thumbnailUrl,
                width: screenWidth * 0.8,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.015,
                ),
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Text(
                  widget.name,
                  style:
                      AppTextStyles.medium24w700.apply(color: AppColors.white),
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
