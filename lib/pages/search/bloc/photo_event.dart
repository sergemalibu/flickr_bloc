part of 'photo_bloc.dart';

abstract class PhotoEvent {}

class SearchPhotoEvent extends PhotoEvent {
  final String query;
  SearchPhotoEvent(this.query);
}

class UpdatePhotoEvent extends PhotoEvent {}

class ChangeGridEvent extends PhotoEvent {}
