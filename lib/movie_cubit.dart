import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit_state.dart';
import 'package:movies_app/movies_data_source.dart';
import '';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(InitialState());

  Future<void> getMovies() async {
    final moviesDataSource = MoviesDataSource();

    try {
      emit(MovieLoadingState());
      final movies = await moviesDataSource.getMovies();
      emit(MovieLoadedState(movies));
    } catch (e) {
      emit(MovieErrorState(e.toString()));
    }
  }
}
