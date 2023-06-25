import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorite_bloc.dart';

class FavoritePhotoView extends StatelessWidget {
  const FavoritePhotoView({super.key});

  static const String clearText = 'Вы очистили избранное';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const CircularProgressIndicator();
              } else if (state is FavoriteLoaded) {
                final List<String> favoritePhoto = state.favorite;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: favoritePhoto.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            favoritePhoto[index],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is FailureLoadingFavorite) {
                return Center(
                  child: Text(state.exception.toString()),
                );
              }
              return const Center(
                  child: Text(
                clearText,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ));
            },
          ),
        ),
      ],
    );
  }
}
