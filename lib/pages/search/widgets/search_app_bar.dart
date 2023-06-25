import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/photo_bloc.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  static const String _hintText = 'Поиск...';

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 10),
        //SearchPhoto
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                context
                    .read<PhotoBloc>()
                    .add(SearchPhotoEvent(_controller.text));
                _controller.clear();
              },
              icon: const Icon(Icons.search),
            ),
            hintText: SearchAppBar._hintText,
            border: InputBorder.none,
          ),
        ),
      )),
    );
  }
}
