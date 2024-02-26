import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo_flutter/model/response_model/search_data_model.dart';
import 'package:demo_flutter/screens/recipe_list/domain/search_receipe_repository.dart';
import 'package:demo_flutter/utils/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_recipe_state.dart';

@Injectable()
class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit(this.repository) : super(SearchRecipeInitial());
  SearchRecipeListRepository repository;
  List<Recipe>? results;

  Future<SearchDataModel> complexSearchMethod({required String query}) async {
    const String apiUrl = 'https://api.spoonacular.com/recipes/complexSearch';
    final Map<String, dynamic> queryParams = {
      'query': query,
      'apiKey': ConstantString.apiKey
    };

    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final SearchDataModel searchData = SearchDataModel.fromJson(data);
      return searchData;
    } else {
      throw Exception(ConstantString.failToLoadData);
    }
  }
}
