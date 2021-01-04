import 'dart:async';
import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_responses.dart';
import 'package:bloc_mvvm_tutorial/repositories/movie_list.dart';

class MovieBloc {
  MovieListRepository _movieListRepository;
  StreamController _movieListController;

  StreamSink<ApiResponse<MovieList>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<MovieList>> get movieListStream =>
      _movieListController.stream;

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading("Fetching movies"));
    try {
      MovieList movies = await _movieListRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  MovieBloc() {
    fetchMovieList();
  }

  dispose() {}
}
