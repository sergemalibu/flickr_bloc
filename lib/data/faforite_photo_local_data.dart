import 'package:shared_preferences/shared_preferences.dart';

class FavoritePhotoLocalData {
  static const String key = 'items';
  int faforiteLength;
  FavoritePhotoLocalData([this.faforiteLength = 0]);

  Future<void> addFavorite(imageUrl) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> faforitePhoto = await getFavorite();
    bool isConstains = faforitePhoto.contains(imageUrl);
    if (isConstains) {
      return;
    }
    faforitePhoto.add(imageUrl);
    await prefs.setStringList(key, faforitePhoto);
  }

  Future<List<String>> getFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> faforitePhoto = prefs.getStringList(key) ?? [];
    faforiteLength = faforitePhoto.length;
    return faforitePhoto;
  }

  Future clearFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
