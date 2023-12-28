class MovieModel {
  final int id;
  final double voteAverage;
  final String posterPath;

  MovieModel({required this.id, required this.voteAverage, required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(id: json['id'], voteAverage: json['vote_average'], posterPath: json['poster_path']);
  }
}