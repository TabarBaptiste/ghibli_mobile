import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:ghibli/models/movies.dart';
import 'package:ghibli/services/movies_api_services.dart';

class MovieWidget extends StatelessWidget {
  final String? id;
  const MovieWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: MoviesApiServices().getMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Movie movie = snapshot.data!.firstWhere((m) => m.id == id);

          double rating = double.tryParse(movie.rt_score ?? '0') ?? 0;
          double starRating = (rating / 20).clamp(0, 5); // Note sur 5

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Colonne gauche - Image
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.network(movie.image ?? '', width: 200),
                      const SizedBox(height: 16),
                      Text(
                        movie.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      RatingStars(
                        value: starRating,
                        starCount: 5,
                        starSize: 30,
                        starColor: Colors.amber,
                        valueLabelVisibility: false,
                      ),
                      Text(
                        "${(starRating).toStringAsFixed(1)}/5",
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                /// Colonne droite - Infos du film
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(
                        label: "Titre original :",
                        value: movie.original_title,
                      ),
                      InfoRow(
                        label: "Romanisation :",
                        value: movie.original_title_romanised,
                      ),
                      InfoRow(label: "Réalisateur :", value: movie.director),
                      InfoRow(label: "Producteur :", value: movie.producer),
                      InfoRow(
                        label: "Date de sortie :",
                        value: movie.release_date,
                      ),
                      InfoRow(
                        label: "Durée :",
                        value: "${movie.running_time} minutes",
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Description :",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.description ?? '',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text("Erreur lors du chargement du film."));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(value ?? '-', overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
