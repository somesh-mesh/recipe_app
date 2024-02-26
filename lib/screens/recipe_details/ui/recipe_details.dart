import 'package:demo_flutter/screens/recipe_details/ui/recipe_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsScreen extends StatefulWidget {
  int? recipeId;

  RecipeDetailsScreen({super.key, this.recipeId});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeDetailsCubit>().getReciepeDetails(widget.recipeId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecipeDetailsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<RecipeDetailsCubit, RecipeDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is RecipeDetailsLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.green,
                ))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            cubit.recipeDetailsModel?.image.toString() ?? "",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Summary:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(replaceTags(
                          cubit.recipeDetailsModel?.summary.toString() ?? "")),
                      const SizedBox(height: 16),
                      const Text(
                        'Ingredients:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (cubit.recipeDetailsModel?.extendedIngredients
                                as List)
                            .map<Widget>((ingredient) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "cauliflower.jpg",
                              ),
                            ),
                            title: Text(
                              '${ingredient.amount?.toString() ?? ''} ${ingredient.unit?.toString() ?? ''} ${ingredient.name?.toString() ?? ''}',
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Instructions:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (cubit.recipeDetailsModel
                                ?.analyzedInstructions as List)
                            .map<Widget>((instruction) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                (instruction.steps as List).map<Widget>((step) {
                              return ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "cauliflower.jpg",
                                  ),
                                ),
                                title: Text(step.step ?? ''),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  String replaceTags(String inputText) {
    inputText =
        inputText.replaceAllMapped(RegExp(r'<a [^>]*>.*?</a>'), (match) => '');
    inputText = inputText.replaceAll('<b>', '');
    inputText = inputText.replaceAll('</b>', '');
    return inputText;
  }
}
