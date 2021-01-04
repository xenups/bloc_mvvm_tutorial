import 'package:bloc_mvvm_tutorial/models/movie.dart';
import 'package:bloc_mvvm_tutorial/networking/api_helper.dart';

class MovieDetailRepository {
  final String _apiKey = "2ad3176cbb73bbb38c64d807d6abe7fb";
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MovieDetail> fetchMovieDetail(int selectedMovie) async {
    final response = await _helper.get("movie/$selectedMovie?api_key=$_apiKey");
    return MovieDetail.fromJson(response);
  }
}
