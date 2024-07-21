import 'package:flutter/material.dart';
import 'package:movies_app/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailedScreen extends StatelessWidget {
  final Movie movie;

  const DetailedScreen({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          leading: null,
          flexibleSpace: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: movie.voteAverage / 2,
                    //minRating: 0,
                    //direction: Axis.horizontal,
                    itemSize:30 ,
                   // allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    onRatingUpdate: (rating) {},
                    ignoreGestures: true,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(${movie.voteCount.toString()})',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                movie.overview,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Release Date: ${movie.releaseDate}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
