import 'package:flutter/material.dart';
import 'package:recipes/constants/routes.dart';
import 'package:recipes/database/recipes_db.dart';

import '../colors.dart';
import '../snackbars.dart';
import '../text_styles.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  final recipeDB = RecipesDB();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () async {
        recipeDB.delete(widget.id);
        ScaffoldMessenger.of(context).showSnackBar(
          AppSnackbars.defaultSnackbar('Receita deletada com sucesso!'),
        );
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          NamedRoute.initial,
        );
      },
      child: SizedBox(
        width: screenWidth * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.white,
              size: screenWidth * 0.05,
            ),
            Text(
              'DELETE',
              style: AppTextStyles.small16w700.apply(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
