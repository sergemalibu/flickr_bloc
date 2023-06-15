part of 'search_bloc.dart';

class SearchEvent {}

class SearchPhotoEvent extends SearchEvent {
  final String query;
  SearchPhotoEvent(this.query);
}

class UpdatePhotoEvent extends SearchEvent {
  final String query;
  final int page;
  UpdatePhotoEvent(this.query, this.page);
}
