import 'package:movies_app/movie.dart';

abstract class MovieState<State> {}

class InitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  MovieLoadedState(this.movies);
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState(this.message);
}
