import 'dart:async';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:movie_app/src/models/movies_model.dart';

class MoviesProvider {
  MoviesProvider();

  int _popularPages = 0;
  List<Movie> _popularMovie = new List();
  bool _loading = false;

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  void disposeStreams() => _popularStreamController?.close();

  String _apiKey = "8db94477a346b9592d356c3c6e77a05e";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  Future<List<Movie>> getInCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    return await _processAnswer(url);
  }

  Future<List<Movie>> getPopular() async {
    _popularPages++;

    if (_loading) return [];
    _loading = true;
    print("tu puta madre");

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPages.toString()
    });

    final resp = await _processAnswer(url);
    _popularMovie.addAll(resp);
    popularSink(_popularMovie);
    _loading = false;
    return resp;
  }

  Future<List<Movie>> _processAnswer(Uri url) async {
    final res = await http.get(url);

    final decodedData = json.decode(res.body);

    final moviesJson = new Movies.fromJsonList(decodedData['results']);

    return moviesJson.movies;
  }
}
