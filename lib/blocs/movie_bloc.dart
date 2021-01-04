import 'dart:async';
import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_responses.dart';
import 'package:bloc_mvvm_tutorial/repositories/movie_list.dart';
import 'package:flutter/material.dart';

class MovieListBloc {
  MovieListRepository _movieListRepository;

  StreamController _movieListController;

  StreamSink<ApiResponse<MovieList>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<MovieList>> get movieListStream =>
      _movieListController.stream;

  MovieListBloc() {
    _movieListController = StreamController<ApiResponse<MovieList>>();
    _movieListRepository = MovieListRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Movies'));
    try {
      MovieList movies = await _movieListRepository.fetchMovieList();
      print(movies);
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}

