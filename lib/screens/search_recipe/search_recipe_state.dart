part of 'search_recipe_cubit.dart';

@immutable
abstract class SearchRecipeState {}

class SearchRecipeInitial extends SearchRecipeState {}

class SearchRecipeLoading extends SearchRecipeState {}

class SearchRecipeLoaded extends SearchRecipeState {}

class SearchRecipeError extends SearchRecipeState {
  final String? message;
  SearchRecipeError({this.message});
}

class SearchRecipeSuccess extends SearchRecipeState {
  final String? message;
  SearchRecipeSuccess({this.message});
}
