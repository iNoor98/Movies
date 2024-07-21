import 'package:flutter/material.dart';

import 'detailed_screen.dart';
import 'movie.dart';

class CardItem extends StatelessWidget {
  final Movie movie;

  const CardItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Card(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
