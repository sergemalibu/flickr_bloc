import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../detail_photo.dart';
import '../bloc/photo_bloc.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key});

  static const _search = 'Что будем искать?';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              final photo = state.photo;
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.exception) {
                return Center(
                  child: Text(textAlign: TextAlign.center, state.exceptionText),
                );
              } else if (photo.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      //Refresh
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<PhotoBloc>().add(UpdatePhotoEvent());
                        },
                        //GridView
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: state.crossAxisCount),
                          itemCount: 40,
                          itemBuilder: (context, index) {
                            String server = state.photo[index]['server'];
                            String secret = state.photo[index]['secret'];
                            String id = state.photo[index]['id'];
                            dynamic imageUrl =
                                'https://live.staticflickr.com/$server/${id}_$secret.jpg';

                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPhoto(imageUrl: imageUrl),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(imageUrl),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    _search,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
