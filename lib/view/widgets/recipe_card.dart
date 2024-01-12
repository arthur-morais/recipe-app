import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/text_styles.dart';
import 'package:recipes/view/widgets/recipe_dialog.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({
    super.key,
    required this.name,
    required this.ingredientsAndMeasurements,
    required this.thumbnailUrl,
    required this.instructions,
    required this.description,
  });
  final String name;
  final List ingredientsAndMeasurements;
  final String thumbnailUrl;
  final List instructions;
  final String description;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return RecipeDialog(
              mealInstructions: widget.instructions,
              mealIngredientsAndMeasurements: widget.ingredientsAndMeasurements,
              mealName: widget.name,
              mealDescription: widget.description,
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
