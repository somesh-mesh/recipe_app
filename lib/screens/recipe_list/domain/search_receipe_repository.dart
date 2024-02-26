import 'package:demo_flutter/model/response_model/search_data_model.dart';
import 'package:demo_flutter/model/response_model/search_recipe_list_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRecipeListRepository{
  Future<Either<ErrorException, SearchRecipeListModel?>> getSearchRecipeList();
  Future<Either<ErrorException, SearchDataModel?>> getSearchData(String query);
}