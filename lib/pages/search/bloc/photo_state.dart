part of 'photo_bloc.dart';

class PhotoState {
  List photo;
  int page;
  int crossAxisCount;
  bool isLoading;
  String search;
  bool exception;
  String exceptionText;

  PhotoState({
    this.photo = const [],
    this.page = 1,
    this.crossAxisCount = 1,
    this.isLoading = false,
    this.search = '',
    this.exception = false,
    this.exceptionText = 'exception',
  });

  PhotoState copyWith({
    List? photo,
    int? page,
    int? crossAxisCount,
    bool isLoading = false,
    String? search,
    bool exception = false,
    Object? exceptionText,
  }) {
    return PhotoState(
      photo: photo ?? this.photo,
      page: page ?? this.page,
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      isLoading: isLoading,
      search: search ?? this.search,
      exception: exception,
      exceptionText: exceptionText.toString(),
    );
  }
}
