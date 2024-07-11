import 'package:flutter/material.dart';

class MoviesGridview extends StatelessWidget {
  const MoviesGridview({super.key});

  final String movieId = 'movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movies',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container();
          },
          itemCount: 2,
        ));
  }
}
