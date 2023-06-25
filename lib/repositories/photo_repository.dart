import 'package:dio/dio.dart';

class PhotoRepository {
  final Dio _dio = Dio();
  static const String _apiKey = 'e765b6800b816280fb3ec85cdc0be4a9';
  static const String _url =
      'https://www.flickr.com/services/rest/?method=flickr.photos.search&';

  Future searchPhoto(keyword) async {
    String keywordsearch = keyword;
    String params =
        'api_key=$_apiKey&text=$keywordsearch&format=json&nojsoncallback=1&per_page=40&page=1';
    final res = await _dio.get(_url + params);
    return res;
  }

  Future updatePhoto(query, updatePage) async {
    final String newKeyword = query;
    final int newPage = updatePage;
    String params =
        'api_key=$_apiKey&text=$newKeyword&format=json&nojsoncallback=1&per_page=40&page=$newPage';
    final res = await _dio.get(_url + params);
    return res;
  }
}
