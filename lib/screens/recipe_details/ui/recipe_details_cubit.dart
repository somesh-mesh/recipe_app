import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_flutter/model/response_model/recipe_details_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:demo_flutter/screens/recipe_details/domain/recipe_details_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'recipe_details_state.dart';


@Injectable()
class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit(this.recipeDetailsRepository) : super(RecipeDetailsInitial());

  RecipeDetailsRepository recipeDetailsRepository;
  RecipeDetailsModel? recipeDetailsModel;

  getReciepeDetails(int recipeId) async {
    emit(RecipeDetailsLoading());

    final Either<ErrorException, RecipeDetailsModel?> postsEither =
    await recipeDetailsRepository.getRecipeDetails(recipeId);
    postsEither.fold(
          (failure) => emit(RecipeDetailsError(message: failure.message)),
          (response) => employerTypeResponse(response),
    );
  }

  employerTypeResponse(RecipeDetailsModel? response) {
    if (response != null) {
      recipeDetailsModel = response;
      emit(RecipeDetailsSuccess(message: "Success"));
    } else {
      emit(RecipeDetailsError(message: "Unexpected null response"));
    }
  }

}
