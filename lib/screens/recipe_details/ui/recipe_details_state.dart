part of 'recipe_details_cubit.dart';

@immutable
abstract class RecipeDetailsState {}

class RecipeDetailsInitial extends RecipeDetailsState {}

class RecipeDetailsLoading extends RecipeDetailsState {}

class RecipeDetailsLoaded extends RecipeDetailsState {}

class RecipeDetailsError extends RecipeDetailsState {
  final String? message;
  RecipeDetailsError({this.message});
}

class RecipeDetailsSuccess extends RecipeDetailsState {
  final String? message;
  RecipeDetailsSuccess({this.message});
}
