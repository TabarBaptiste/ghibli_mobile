import 'package:flutter/material.dart';
import 'package:ghibli/models/movies.dart';
import 'package:ghibli/services/movies_api_services.dart';
import 'package:go_router/go_router.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ghibli Movies', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        FutureBuilder(
          future: MoviesApiServices().getMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie> movies = snapshot.requireData;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie.image!,
                          width: 60,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 60,
                                height: 90,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image),
                              ),
                        ),
                      ),
                      title: Text(
                        movie.title ?? 'Titre inconnu',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(movie.original_title ?? ''),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () => context.push('/movie/${movie.id}'),
                    ),
                  );
                },
              );
            }

            if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
