part of 'favorite_bloc.dart';

abstract class FavoriteState {}

class InitialState extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  List<String> favorite;
  FavoriteLoaded(this.favorite);
}

class FavoriteClear extends FavoriteState {}

class FailureLoadingFavorite extends FavoriteState {
  FailureLoadingFavorite(this.exception);
  final Object exception;
}
