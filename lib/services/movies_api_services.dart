import 'dart:convert';

import 'package:ghibli/models/movies.dart';
import 'package:http/http.dart' as http;

class MoviesApiServices {
  Future<List<Movie>> getMovies() async {
    Uri uri = Uri.parse('https://ghibliapi.vercel.app/films');

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);

      List<Movie> results = json.map((data) {
        return Movie.fromJSON(data);
      }).toList();
    
      return results;
    } else {
      throw Error();
      // throw Exception('Failed to load movies');
    }
  }
}
