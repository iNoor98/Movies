import 'dart:convert';
import 'package:dio/dio.dart';
import 'movie.dart';

class MoviesDataSource {
  final dio = Dio();

  Future<List<Movie>> getMovies() async {
    try {
      final Map<String, String> headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjQ2NzA5YmQzZWU1NWQwNjQwZmQzODE0MGU5MDhmNiIsIm5iZiI6MTcyMDczNzg5MC4zOTQ2MTcsInN1YiI6IjY2OTA1Zjc3MzllMzU4ZDdlNWVlMmVmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MAnmMgPRQkk6FGyKJuwXVbZd516xTRTfmeolWDhkNPk',
        'accept': ' application/json',
      };
      final response = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc',
        options: Options(headers: headers),
      );
      // Parse the JSON string
      final Map<String, dynamic> map = jsonDecode(response.toString());

      // Create an instance of moviesResponse
      final moviesResponse = MovieResponse.fromJson(map);
      return moviesResponse.results;
    } catch (_) {
      rethrow;
    }
  }
}
