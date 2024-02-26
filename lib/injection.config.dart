// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_flutter/screens/recipe_details/data/search_receipe_repository_impl.dart'
    as _i4;
import 'package:demo_flutter/screens/recipe_details/domain/recipe_details_repository.dart'
    as _i3;
import 'package:demo_flutter/screens/recipe_details/ui/recipe_details_cubit.dart'
    as _i7;
import 'package:demo_flutter/screens/recipe_list/data/search_receipe_repository_impl.dart'
    as _i6;
import 'package:demo_flutter/screens/recipe_list/domain/search_receipe_repository.dart'
    as _i5;
import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen_cubit.dart'
    as _i8;
import 'package:demo_flutter/screens/search_recipe/search_recipe_cubit.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.RecipeDetailsRepository>(
        _i4.RecipeDetailsRepositoryImpl());
    gh.singleton<_i5.SearchRecipeListRepository>(
        _i6.SearchRecipeListRepositoryImpl());
    gh.factory<_i7.RecipeDetailsCubit>(
        () => _i7.RecipeDetailsCubit(gh<_i3.RecipeDetailsRepository>()));
    gh.factory<_i8.SearchReceipeScreenCubit>(() =>
        _i8.SearchReceipeScreenCubit(gh<_i5.SearchRecipeListRepository>()));
    gh.factory<_i9.SearchRecipeCubit>(
        () => _i9.SearchRecipeCubit(gh<_i5.SearchRecipeListRepository>()));
    return this;
  }
}
