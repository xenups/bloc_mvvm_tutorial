import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_helper.dart';

class MovieDetailRepository {
  final String _apiKey = "key";
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MovieDetail> fetchMovieDetail(int selectedMovie) async {
    final response = await _helper.get("movie/$selectedMovie?api_key=$_apiKey");
    return MovieDetail.fromJson(response);
  }
}
