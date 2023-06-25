import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/photo_bloc.dart';

class ChangeGrid extends StatelessWidget {
  const ChangeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.crossAxisCount == 1)
              IconButton(
                  onPressed: () {
                    context.read<PhotoBloc>().add(ChangeGridEvent());
                  },
                  icon: const Icon(Icons.view_stream)),
            if (state.crossAxisCount == 2)
              IconButton(
                  onPressed: () {
                    context.read<PhotoBloc>().add(ChangeGridEvent());
                  },
                  icon: const Icon(Icons.view_list)),
            if (state.crossAxisCount == 4)
              IconButton(
                  onPressed: () {
                    context.read<PhotoBloc>().add(ChangeGridEvent());
                  },
                  icon: const Icon(Icons.grid_on)),
          ],
        );
      },
    );
  }
}
