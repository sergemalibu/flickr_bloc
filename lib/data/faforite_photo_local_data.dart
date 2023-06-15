import 'package:shared_preferences/shared_preferences.dart';

class FavoritePhotoLocalData {
  static const key = 'items';
  int favLength;
  FavoritePhotoLocalData([this.favLength = 0]);

  Future<void> addFavorite(imageUrl) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> faforitePhoto = await getFavorite() as List<String>;

    faforitePhoto.add(imageUrl);
    await prefs.setStringList(key, faforitePhoto);
  }

  Future getFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> faforitePhoto = prefs.getStringList(key) ?? [];
    favLength = faforitePhoto.length;

    return faforitePhoto;
  }

  Future getFavoriteLength() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int faforitePhotoLength = prefs.getStringList(key) as int;

    return faforitePhotoLength;
  }

  Future clearFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
