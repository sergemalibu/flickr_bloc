import 'package:flutter/material.dart';
import '../widgets/change_grid.dart';
import '../widgets/favorite_button.dart';
import '../widgets/photo_view.dart';
import '../widgets/search_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchAppBar(),
        actions: const [
          FavoriteButton(),
          ChangeGrid(),
        ],
      ),
      body: const PhotoView(),
    );
  }
}
