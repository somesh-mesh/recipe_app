import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:demo_flutter/model/response_model/recipe_details_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:demo_flutter/network/api_error.dart';
import 'package:demo_flutter/network/api_service.dart';
import 'package:demo_flutter/network/end_points/api_url.dart';
import 'package:demo_flutter/screens/recipe_details/domain/recipe_details_repository.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: RecipeDetailsRepository)
class RecipeDetailsRepositoryImpl implements RecipeDetailsRepository {

  @override
  Future<Either<ErrorException, RecipeDetailsModel?>> getRecipeDetails(int recipeId) async {
    try {
      Response? response = await ApiHelper.apiGet(
        "${APIUrl.recipeDetails}/$recipeId/information");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic dataResponse = jsonDecode(response.body);
        final responseData = RecipeDetailsModel.fromJson(dataResponse);
        return Right(responseData);
      } else {
        final dynamic errorResponse = jsonDecode(response.body);
        final errorData = errorResponse;
        return Left(ErrorException(message: errorData.message,key: ""));
      }
    } catch (err) {
      return Left(getErrorFromException(err));
    }
  }
}