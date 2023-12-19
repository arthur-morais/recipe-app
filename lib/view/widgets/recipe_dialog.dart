import 'package:flutter/material.dart';

Future<void> recipeDialog(
  BuildContext context, {
  required List mealInstructions,
  required List mealIngredientsAndMeasurements,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      final double screenHeight = MediaQuery.of(context).size.height;

      return Dialog(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bistek'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ingredients'),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                const Text('Instructions'),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.delete),
                        Text(
                          'EDIT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.delete),
                        Text(
                          'DELETE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
