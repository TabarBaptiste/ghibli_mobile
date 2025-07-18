// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ghibli/models/movies.dart';
import 'package:ghibli/services/movies_api_services.dart';
import 'package:go_router/go_router.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // inspect(MoviesApiServices().getMovies());
    return Column(
      children: [
        Text('Movies', style: Theme.of(context).textTheme.titleMedium),
        FutureBuilder(
          future: MoviesApiServices().getMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie> movies = snapshot.requireData;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: movies.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(movies[index].image!, width: 80),
                    title: Text(movies[index].title!),
                    subtitle: Text(movies[index].original_title!),
                    trailing: Icon(Icons.chevron_right),

                    onTap: () => context.push('/movie/${movies[index].id}'),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
