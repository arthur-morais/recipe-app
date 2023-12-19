import 'package:flutter/material.dart';
import 'package:recipes/view/widgets/custom_text_form_field.dart';

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
                      fieldLabel: 'Recipe name',
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    TextFormField(
                      controller: ingredientsAndMeasurementsController,
                      decoration: const InputDecoration(),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    TextFormField(
                      controller: instructionsController,
                      decoration: const InputDecoration(),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.025,
                    ),
                    TextFormField(
                      controller: thumbnailUrlController,
                      decoration: const InputDecoration(),
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
