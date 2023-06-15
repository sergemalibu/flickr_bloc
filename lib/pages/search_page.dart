import 'package:flickr/search_bloc/search_bloc.dart';
import 'package:flickr/pages/detail_photo.dart';
import 'package:flickr/pages/favorite_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ViewType _viewType = ViewType.list;
  String _searchPhoto = '';
  int _intPage = 2;
  int _crossAxiscount = 1;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final photo = context.select((SearchBloc bloc) => bloc.state.photo);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_searchPhoto.isNotEmpty) {
                      context
                          .read<SearchBloc>()
                          .add(SearchPhotoEvent(_searchPhoto));
                      setState(
                        () {
                          controller.clear();
                          _intPage = 2;
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
                hintText: 'Поиск...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _searchPhoto = value;
              },
            ),
          )),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const FavoritePhoto()),
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
          IconButton(
            icon: Icon(
              _viewType == ViewType.list
                  ? Icons.view_stream
                  : (_viewType == ViewType.single
                      ? Icons.grid_on
                      : Icons.view_list),
            ),
            onPressed: () {
              if (_viewType == ViewType.single) {
                _crossAxiscount = 1;
                _viewType = ViewType.list;
              } else if (_viewType == ViewType.list) {
                _crossAxiscount = 2;
                _viewType = ViewType.grid;
              } else {
                _crossAxiscount = 4;

                _viewType = ViewType.single;
              }

              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (photo.isEmpty)
            const Center(
                child: Text(
              'Что будем искать?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
          if (photo.isNotEmpty)
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                bloc: SearchBloc(),
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<SearchBloc>()
                          .add(UpdatePhotoEvent(_searchPhoto, _intPage));
                      setState(
                        () {
                          _intPage++;
                        },
                      );
                    },
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _crossAxiscount),
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        String server = photo[index]['server'];
                        String secret = photo[index]['secret'];
                        String id = photo[index]['id'];

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
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

enum ViewType { grid, list, single }
