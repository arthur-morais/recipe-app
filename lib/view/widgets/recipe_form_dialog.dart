import 'package:flutter/material.dart';
import 'package:recipes/constants/colors.dart';
import 'package:recipes/constants/snackbars.dart';
import 'package:recipes/constants/validator.dart';
import 'package:recipes/constants/widgets/custom_button.dart';
import 'package:recipes/constants/widgets/custom_text_form_field.dart';
import 'package:recipes/database/recipes_db.dart';

import '../../constants/routes.dart';

class RecipeFormDialog extends StatefulWidget {
  RecipeFormDialog({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ingredientsAndMeasurementsController = TextEditingController();
  final thumbnailUrlController = TextEditingController();
  final instructionsController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  State<RecipeFormDialog> createState() => _RecipeFormDialogState();
}

class _RecipeFormDialogState extends State<RecipeFormDialog> {
  final recipeDB = RecipesDB();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Dialog(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add a new custom recipe!'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.025,
            ),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    fieldLabel: 'Recipe Name',
                    controller: widget.nameController,
                    validator: Validator.validateBasic,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  CustomTextFormField(
                    fieldLabel: 'Ingredients and Measurements',
                    controller: widget.ingredientsAndMeasurementsController,
                    validator: Validator.validateBasic,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  CustomTextFormField(
                    fieldLabel: 'Recipe Instructions',
                    controller: widget.instructionsController,
                    validator: Validator.validateBasic,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  CustomTextFormField(
                    fieldLabel: 'Recipe Description',
                    controller: widget.descriptionController,
                    validator: Validator.validateBasic,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  CustomTextFormField(
                    fieldLabel: 'Recipe Thumbnail URL',
                    controller: widget.thumbnailUrlController,
                    validator: Validator.validateUrl,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  CustomButton(
                    buttonText: 'Submit',
                    buttonColor: AppColors.primary,
                    textColor: AppColors.white,
                    onPressed: () async {
                      if (widget.formKey.currentState!.validate()) {
                        await recipeDB.create(
                          name: widget.nameController.text,
                          instructions: widget.instructionsController.text,
                          thumbnailUrl: widget.thumbnailUrlController.text,
                          ingredientsAndMeasurement:
                              widget.ingredientsAndMeasurementsController.text,
                          description: widget.descriptionController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          AppSnackbars.defaultSnackbar(
                              'Receita criada com sucesso!'),
                        );
                        if (!mounted) return;
                        Navigator.pushReplacementNamed(
                          context,
                          NamedRoute.initial,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
