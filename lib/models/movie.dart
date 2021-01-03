class MovieDetail {
  int voteCount;
  int id;
  bool video;
  var voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  MovieDetail(
      {this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  MovieDetail.fromJson(Map<String, dynamic> json) {
    voteCount = json["vote_count"];
    id = json["id"];
    video = json['video'];
    voteAverage = json['vote_average'];
    title = json['title'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["vote_count"] = this.voteCount;
    data["id"] = this.id;
    data["video"] = this.video;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}

class MovieList {
  int page;
  int totalResults;
  int totalPages;
  List<MovieDetail> results;

  MovieList({this.page, this.totalResults, this.totalPages, this.results});

  MovieList.fromJson(Map<String, dynamic> json) {
    this.page = json["page"];
    this.totalResults = json["total_results"];
    this.totalPages = json["total_pages"];
    results = new List<MovieDetail>();
    json["results"].forEach((movieDetail) {
      results.add(new MovieDetail.fromJson(movieDetail));
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["page"] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    data['results'] = this.results.map((e) => e.toJson()).toList();
    return data;
  }
}
