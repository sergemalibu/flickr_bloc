import 'package:flickr/data/faforite_photo_local_data.dart';
import 'package:flutter/material.dart';

class DetailPhoto extends StatelessWidget {
  const DetailPhoto({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          sizedBox(imageUrl),
          elevatedButton(imageUrl),
        ],
      ),
    );
  }
}

Widget sizedBox(imageUrl) {
  return SizedBox(
    height: 300,
    width: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    ),
  );
}

Widget elevatedButton(imageUrl) {
  final addFavorite = FavoritePhotoLocalData();
  return ElevatedButton(
    onPressed: () {
      addFavorite.addFavorite(imageUrl);
    },
    child: const Text(
      'Добавить в избранное',
    ),
  );
}
