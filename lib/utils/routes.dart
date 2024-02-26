import 'package:demo_flutter/injection.dart';
import 'package:demo_flutter/screens/recipe_details/ui/recipe_details.dart';
import 'package:demo_flutter/screens/recipe_details/ui/recipe_details_cubit.dart';
import 'package:demo_flutter/screens/search_recipe/search_recipe.dart';
import 'package:demo_flutter/screens/search_recipe/search_recipe_cubit.dart';
import 'package:demo_flutter/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.searchRecipe:
        final arguments = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SearchRecipeCubit>(),
                  child: SearchRecipe(searchKeyWord: arguments),
                ));

      case RouterName.recipeDetails:
        final arguments = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<RecipeDetailsCubit>(),
                  child: RecipeDetailsScreen(recipeId: arguments),
                ));
    }

    return null;
  }
}
