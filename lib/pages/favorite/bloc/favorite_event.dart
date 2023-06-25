part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class LoadingFavoriteEvent extends FavoriteEvent {}

class ClearFavoriteEvent extends FavoriteEvent {}
