import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/faforite_photo_local_data.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(InitialState()) {
    on<LoadingFavoriteEvent>(_onFetch);
    on<ClearFavoriteEvent>(_onClear);
  }

  final _favoritePhotoLocalData = FavoritePhotoLocalData();

  _onFetch(LoadingFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favoritePhoto = await _favoritePhotoLocalData.getFavorite();
      emit(FavoriteLoaded(favoritePhoto));
    } catch (e) {
      emit(FailureLoadingFavorite(e));
    }
  }

  _onClear(ClearFavoriteEvent event, Emitter<FavoriteState> emit) {
    emit(FavoriteLoading());
    try {
      _favoritePhotoLocalData.clearFavorite();
      emit(FavoriteClear());
    } catch (e) {
      emit(FailureLoadingFavorite(e));
    }
  }
}
