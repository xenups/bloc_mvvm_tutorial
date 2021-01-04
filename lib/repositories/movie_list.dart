import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_helper.dart';

class MovieListRepository {
  String _apiKey = "key";
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MovieList> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieList.fromJson(response);
  }
}
