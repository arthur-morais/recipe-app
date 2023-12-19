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

    return GestureDetector(
      onTap: () {
        recipeDialog(
          context,
          mealInstructions: widget.instructions,
          mealIngredientsAndMeasurements: widget.ingredientsAndMeasurements,
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
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Text(
                  widget.name,
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
