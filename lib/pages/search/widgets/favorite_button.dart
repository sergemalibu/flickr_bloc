import 'package:flickr/pages/favorite/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favorite/view/favorite_photo.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteBloc>().add(LoadingFavoriteEvent());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const FavoritePhoto()),
          ),
        );
      },
      icon: const Icon(Icons.star),
    );
  }
}
