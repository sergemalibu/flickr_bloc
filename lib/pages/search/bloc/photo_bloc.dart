import 'package:flickr/repositories/photo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoState()) {
    on<SearchPhotoEvent>(_onSearch);
    on<ChangeGridEvent>(_onGrid);
    on<UpdatePhotoEvent>(_onUpdate);
  }

  final _photoRepository = PhotoRepository();

  _onSearch(SearchPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(state.copyWith(isLoading: true));
    final String keyword = event.query;

    try {
      final res = await _photoRepository.searchPhoto(keyword);
      emit(state.copyWith(
          photo: res.data['photos']?['photo'],
          page: res.data['photos']?['page'],
          search: keyword));
    } catch (e) {
      emit(state.copyWith(exception: true, exceptionText: e.toString()));
    }
  }

  _onGrid(ChangeGridEvent event, Emitter<PhotoState> emit) {
    int? changeCrossAxiscount;
    if (state.crossAxisCount == 1) {
      changeCrossAxiscount = state.crossAxisCount + 1;
    }
    if (state.crossAxisCount == 2) {
      changeCrossAxiscount = state.crossAxisCount + 2;
    }
    if (state.crossAxisCount == 4) {
      changeCrossAxiscount = state.crossAxisCount - 3;
    }

    emit(state.copyWith(crossAxisCount: changeCrossAxiscount));
  }

  _onUpdate(UpdatePhotoEvent event, Emitter<PhotoState> emit) async {
    final String query = state.search;
    final int updatePage = state.page + 1;

    try {
      final res = await _photoRepository.updatePhoto(query, updatePage);
      emit(state.copyWith(
        photo: res.data['photos']?['photo'],
        page: updatePage,
        search: state.search,
      ));
    } catch (e) {
      emit(state.copyWith(exception: true, exceptionText: e.toString()));
    }
  }
}
