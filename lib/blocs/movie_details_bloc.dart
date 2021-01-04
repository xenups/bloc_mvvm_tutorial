import 'dart:async';

import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_responses.dart';
import 'package:bloc_mvvm_tutorial/repositories/movie_details.dart';

class MovieDetailBloc {
  MovieDetailRepository _movieDetailRepository;

  StreamController _movieDetailController;

  StreamSink<ApiResponse<MovieDetail>> get movieDetailSink =>
      _movieDetailController.sink;

  Stream<ApiResponse<MovieDetail>> get movieDetailStream =>
      _movieDetailController.stream;

  MovieDetailBloc(selectedMovie) {
    _movieDetailController = StreamController<ApiResponse<MovieDetail>>();
    _movieDetailRepository = MovieDetailRepository();
    fetchMovieDetail(selectedMovie);
  }

  fetchMovieDetail(int selectedMovie) async {
    movieDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      MovieDetail details =
      await _movieDetailRepository.fetchMovieDetail(selectedMovie);
      movieDetailSink.add(ApiResponse.completed(details));
    } catch (e) {
      movieDetailSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieDetailController?.close();
  }
}