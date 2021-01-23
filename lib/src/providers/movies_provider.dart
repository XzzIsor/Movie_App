

import 'package:movie_app/src/models/movies_model.dart';

class MoviesProvider {
  String _apiKey = "8db94477a346b9592d356c3c6e77a05e";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  Future<List<Movie>> getInCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language
    });

  
}
