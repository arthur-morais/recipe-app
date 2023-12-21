import 'package:flutter/material.dart';
import 'package:recipes/constants/widgets/custom_text_form_field.dart';

Future<void> newRecipeFormDialog(
  BuildContext context,
) {
  final screenSize = MediaQuery.of(context).size;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ingredientsAndMeasurementsController = TextEditingController();
  final thumbnailUrlController = TextEditingController();
  final instructionsController = TextEditingController();
  final descriptionController = TextEditingController();


  return showDialog(
    context: context,
    builder: (context) {
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
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      fieldLabel: 'Recipe Name',
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    CustomTextFormField(
                      fieldLabel: 'Ingredients and Measurements',
                      controller: ingredientsAndMeasurementsController,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    CustomTextFormField(
                      fieldLabel: 'Recipe Instructions',
                      controller: instructionsController,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    CustomTextFormField(
                      fieldLabel: 'Recipe Description',
                      controller: descriptionController,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    CustomTextFormField(
                      fieldLabel: 'Recipe Thumbnail URL',
                      controller: thumbnailUrlController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
