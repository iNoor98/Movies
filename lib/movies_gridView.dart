import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit_state.dart';
import 'package:movies_app/movie_card_item.dart';
import 'package:movies_app/movie_cubit.dart';

class MoviesGridview extends StatelessWidget {
  MoviesGridview({super.key});

  final _movieCubit = MovieCubit();

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
      body: BlocProvider(
        create: (context) => _movieCubit..getMovies(),
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieLoadedState) {
              if (state.movies.isEmpty) {
                return _buildError();
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardItem(
                    movie: state.movies[index],
                  );
                },
              );
            }

            if (state is MovieErrorState) {
              return _buildError();
            }
            return const Center(
              child: Text(
                'Content not available',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildError() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 50.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Content not available',
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
