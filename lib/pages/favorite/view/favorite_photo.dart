import 'package:flutter/material.dart';
import '../widgets/clear_button.dart';
import '../widgets/faforite_photo_view.dart';

class FavoritePhoto extends StatelessWidget {
  const FavoritePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ClearButton(),
        ],
      ),
      body: const FavoritePhotoView(),
    );
  }
}
