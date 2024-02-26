part of 'search_receipe_screen_cubit.dart';

@immutable
abstract class SearchReceipeScreenState {}

class SearchReceipeScreenInitial extends SearchReceipeScreenState {}

class SearchReceipeScreenLoading extends SearchReceipeScreenState {}

class SearchReceipeScreenLoaded extends SearchReceipeScreenState {}

class SearchReceipeScreenError extends SearchReceipeScreenState {
  final String? message;
  SearchReceipeScreenError({this.message});
}

class SearchReceipeScreenSuccess extends SearchReceipeScreenState {
  final String? message;
  SearchReceipeScreenSuccess({this.message});
}
class SearchReceipeScreenDatabaseInitialized extends SearchReceipeScreenState {}



