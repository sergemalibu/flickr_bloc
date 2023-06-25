import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorite_bloc.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});

  static const String _clear = 'очистить';

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<FavoriteBloc>().add(ClearFavoriteEvent());
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text(
          _clear,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
