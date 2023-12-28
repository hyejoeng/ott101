
import 'package:flutter/cupertino.dart';
import 'package:ott101/data/models/movie_model.dart';
import 'package:ott101/main.dart';

class TMDBProvider extends ChangeNotifier {
  MovieModel? mainMovie;

  Future<void> getMainMovie() async {
    try {
      final response = await client.get(
          Uri.https('api.themoviedb.org', '3/movie/$movieId', {"language": "ko-KR"}),
          headers: {'Authorization': 'Bearer $apiToken'}
      );

      if (response.statusCode!= 200) {
        // 앱 종료
      }
    } catch (e) {
      // mainMovie = MovieModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      notifyListeners();
    }
  }
}