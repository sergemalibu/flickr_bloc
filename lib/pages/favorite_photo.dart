import 'package:flickr/data/faforite_photo_local_data.dart';
import 'package:flutter/material.dart';

class FavoritePhoto extends StatefulWidget {
  const FavoritePhoto({super.key});

  @override
  State<FavoritePhoto> createState() => _FavoritePhotoState();
}

class _FavoritePhotoState extends State<FavoritePhoto> {
  final _favoritePhotoLocalData = FavoritePhotoLocalData();
  late Future _faforitePhoto;

  @override
  void initState() {
    _faforitePhoto = _favoritePhotoLocalData.getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              _favoritePhotoLocalData.clearFavorite();
              _faforitePhoto = _favoritePhotoLocalData.getFavorite();
              setState(() {});
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'очистить',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: _faforitePhoto,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _favoritePhotoLocalData.favLength,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      snapshot.data[index].toString(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
