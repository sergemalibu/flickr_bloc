import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

const _apiKey = 'e765b6800b816280fb3ec85cdc0be4a9';
const _currentPage = 1;
final _httpClient = Dio();
const _url =
    'https://www.flickr.com/services/rest/?method=flickr.photos.search&';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchPhotoEvent>((_onSearch));
    on<UpdatePhotoEvent>(_onUpdate);
  }

  _onSearch(SearchPhotoEvent event, Emitter<SearchState> emit) async {
    final String keyword = event.query;
    String params =
        'api_key=$_apiKey&text=$keyword&format=json&nojsoncallback=1&per_page=40&page=$_currentPage';

    final res = await _httpClient.get(_url + params);
    emit(SearchState(photo: res.data['photos']?['photo']));
  }

  _onUpdate(UpdatePhotoEvent event, Emitter<SearchState> emit) async {
    final String keyword = event.query;
    final int updatePage = event.page;
    String params =
        'api_key=$_apiKey&text=$keyword&format=json&nojsoncallback=1&per_page=40&page=$updatePage';

    final res = await _httpClient.get(_url + params);
    emit(SearchState(photo: res.data['photos']?['photo']));
  }
}
