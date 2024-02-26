import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo_flutter/model/response_model/search_data_model.dart';
import 'package:demo_flutter/model/response_model/search_recipe_list_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:demo_flutter/network/api_error.dart';
import 'package:demo_flutter/network/api_service.dart';
import 'package:demo_flutter/network/end_points/api_url.dart';
import 'package:demo_flutter/screens/recipe_list/domain/search_receipe_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart';

@Singleton(as: SearchRecipeListRepository)
class SearchRecipeListRepositoryImpl implements SearchRecipeListRepository {

  @override
  Future<Either<ErrorException, SearchRecipeListModel?>> getSearchRecipeList() async {
    try {
      Response? response = await ApiHelper.apiGet(
          APIUrl.complexSearch,);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic dataResponse = jsonDecode(response.body);
        final responseData = SearchRecipeListModel.fromJson(dataResponse);
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


  @override
  Future<Either<ErrorException, SearchDataModel?>> getSearchData(String query) async {
    try {
      final queryParams = {'query': query};
      Response? response = await ApiHelper.apiGetWithQueryParam("${APIUrl.searchQuery}$query",queryParams: queryParams);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dynamic dataResponse = jsonDecode(response.body);
        final responseData = SearchDataModel.fromJson(dataResponse);
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
