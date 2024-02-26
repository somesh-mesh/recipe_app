// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dartz/dartz.dart';
// import 'package:demo_flutter/model/local_db/data_base_helper.dart';
// import 'package:demo_flutter/model/response_model/search_recipe_list_model.dart';
// import 'package:demo_flutter/network/api_enum.dart';
// import 'package:demo_flutter/screens/recipe_list/domain/search_receipe_repository.dart';
// import 'package:injectable/injectable.dart';
// import 'package:meta/meta.dart';
//
// part 'search_receipe_screen_state.dart';
//
// @Injectable()
// class SearchReceipeScreenCubit extends Cubit<SearchReceipeScreenState> {
//   SearchReceipeScreenCubit(this.repository)
//       : super(SearchReceipeScreenInitial());
//   SearchRecipeListRepository repository;
//
//   List<Results>? results;
//   int? offset;
//   int? number;
//   int? totalResults;
//
//   // getReciepeList() async {
//   //   emit(SearchReceipeScreenLoading());
//   //   var connectivityResult = await Connectivity().checkConnectivity();
//   //   if (connectivityResult == ConnectivityResult.none) {
//   //     results = await DatabaseHelper().retrieveResultsFromSQLite();
//   //     emit(SearchReceipeScreenLoaded());
//   //   } else {
//   //     final Either<ErrorException, SearchRecipeListModel?> postsEither =
//   //         await repository.getSearchRecipeList();
//   //     postsEither.fold(
//   //       (failure) => emit(SearchReceipeScreenError(message: failure.message)),
//   //       (response) => employerTypeResponse(response),
//   //     );
//   //   }
//   // }
//
//
//
//
//
//
//
//   employerTypeResponse(SearchRecipeListModel? response) {
//     if (response != null) {
//       results = response.results;
//       number = response.number;
//       totalResults = response.totalResults;
//       emit(SearchReceipeScreenSuccess(message: "Success"));
//     } else {
//       emit(SearchReceipeScreenError(message: "Unexpected null response"));
//     }
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_flutter/model/local_db/data_base_helper.dart';
import 'package:demo_flutter/model/response_model/search_recipe_list_model.dart';
import 'package:demo_flutter/network/api_enum.dart';
import 'package:demo_flutter/screens/recipe_list/domain/search_receipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_receipe_screen_state.dart';

@Injectable()
class SearchReceipeScreenCubit extends Cubit<SearchReceipeScreenState> {
  SearchReceipeScreenCubit(this.repository)
      : super(SearchReceipeScreenInitial());

  SearchRecipeListRepository repository;

  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;

  getReciepeList() async {
    emit(SearchReceipeScreenLoading());
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      results = await DatabaseHelper().retrieveResultsFromSQLite();
      emit(SearchReceipeScreenLoaded());
    } else {
      final Either<ErrorException, SearchRecipeListModel?> postsEither =
          await repository.getSearchRecipeList();
      postsEither.fold(
        (failure) => emit(SearchReceipeScreenError(message: failure.message)),
        (response) => employerTypeResponse(response),
      );
    }
  }

  employerTypeResponse(SearchRecipeListModel? response) async {
    if (response != null) {
      results = response.results;
      number = response.number;
      totalResults = response.totalResults;

      if (results != null) {
        await DatabaseHelper().insertResultsList(results!);
      }

      emit(SearchReceipeScreenSuccess(message: "Success"));
    } else {
      emit(SearchReceipeScreenError(message: "Unexpected null response"));
    }
  }

  Future<void> initDatabase(DatabaseHelper databaseHelper) async {
    try {
      await databaseHelper.initDatabase();
      emit(SearchReceipeScreenDatabaseInitialized());
    } catch (e) {
      emit(SearchReceipeScreenError(message: "Database initialization failed"));
    }
  }
}
