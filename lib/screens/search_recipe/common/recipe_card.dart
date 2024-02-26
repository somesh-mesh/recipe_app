import 'package:demo_flutter/model/response_model/search_data_model.dart';
import 'package:demo_flutter/screens/recipe_details/ui/recipe_details.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Recipe? recipe;

  RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetailsScreen(recipeId: recipe?.id)),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe?.image.toString() ?? "",
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipe?.title.toString() ?? "",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}