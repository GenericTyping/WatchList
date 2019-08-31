import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watchlist/backend/backend.dart';
import 'package:watchlist/backend/models/models.dart';

class MovieDbApi extends Api {
  const MovieDbApi(ApiEnv env) : super(env);

  Future<http.Response> _httpGet<T>(
    String resource, {
    Map<String, dynamic> queryParameters,
  }) {
    final serializedQuery =
        queryParameters == null ? '' : queryParameters.entries.map((entry) => '&${entry.key}=${entry.value}').join();
    return http.get('${env.host}$resource?api_key=${env.movieDbApiKey}$serializedQuery');
  }

  @override
  Future<Movie> getMovie(int id) async {
    final response = await _httpGet('/movie/$id');
    final result = Movie.fromJson(json.decode(response.body));
    return result;
  }

  @override
  Future<SearchResult> searchMovie(
    String query, {
    int page = 1,
  }) async {
    final response = await _httpGet(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page,
      },
    );

    final result = SearchResult.fromJson(json.decode(response.body));

    return result;
  }
}
