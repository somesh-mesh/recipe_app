import 'package:demo_flutter/model/response_model/recipe_details_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeDetailsRepository{
  Future<Either<ErrorException, RecipeDetailsModel ?>> getRecipeDetails(int id);
}