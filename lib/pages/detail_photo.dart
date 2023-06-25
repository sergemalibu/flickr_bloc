import 'package:flickr/data/faforite_photo_local_data.dart';
import 'package:flutter/material.dart';

class DetailPhoto extends StatelessWidget {
  DetailPhoto({required this.imageUrl, super.key});

  final String imageUrl;
  final _addFavorite = FavoritePhotoLocalData();
  static const _add = 'Добавить в избранное';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addFavorite.addFavorite(imageUrl);
              },
              child: const Text(
                _add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
