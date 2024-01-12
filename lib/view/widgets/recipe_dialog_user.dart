import 'package:flutter/material.dart';
import 'package:recipes/database/recipes_db.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../constants/widgets/delete_button.dart';

class RecipeDialogUser extends StatefulWidget {
  const RecipeDialogUser({
    super.key,
    required this.mealInstructions,
    required this.mealIngredientsAndMeasurements,
    required this.mealName,
    required this.id, required this.mealDescription,
  });

  final String mealDescription;
  final String mealInstructions;
  final String mealIngredientsAndMeasurements;
  final String mealName;
  final int id;

  @override
  State<RecipeDialogUser> createState() => _RecipeDialogUserState();
}

class _RecipeDialogUserState extends State<RecipeDialogUser> {
  final recipeDB = RecipesDB();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Text(
            widget.mealName,
            style: AppTextStyles.small16w700.apply(color: AppColors.white),
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
                  'Meal Description',
                  style: AppTextStyles.medium24w700
                      .apply(color: AppColors.neutral90),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Text(
                  widget.mealDescription,
                  style: AppTextStyles.small14w400
                      .apply(color: AppColors.neutral90),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
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
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: screenWidth * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: screenWidth * 0.05,
                          ),
                          Text(
                            'EDIT',
                            style: AppTextStyles.small16w700
                                .apply(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DeleteButton(
                    id: widget.id,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
