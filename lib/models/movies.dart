// ignore_for_file: non_constant_identifier_names

class Movie {
  String? id,
      title,
      original_title,
      original_title_romanised,
      image,
      movie_banner,
      description,
      director,
      producer,
      release_date,
      running_time,
      rt_score;

  Movie({
    required this.id,
    required this.title,
    required this.original_title,
    required this.original_title_romanised,
    required this.image,
    required this.movie_banner,
    required this.description,
    required this.director,
    required this.producer,
    required this.release_date,
    required this.running_time,
    required this.rt_score,
  });

  factory Movie.fromJSON(Map<String, dynamic> data) {
    return Movie(
      id: data['id'],
      title: data['title'],
      original_title: data['original_title'],
      original_title_romanised: data['original_title_romanised'],
      image: data['image'],
      movie_banner: data['movie_banner'],
      description: data['description'],
      director: data['director'],
      producer: data['producer'],
      release_date: data['release_date'],
      running_time: data['running_time'],
      rt_score: data['rt_score'],
    );
  }
}
