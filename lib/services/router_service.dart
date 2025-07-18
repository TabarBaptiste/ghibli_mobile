import 'package:ghibli/screens/home_screen.dart';
import 'package:ghibli/services/movie_screen.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),

        GoRoute(
          path: '/movie/:id',
          name: 'movie',
          builder: (context, state) =>
              MovieScreen(id: state.pathParameters['id']),
        ),
      ],
    );
  }
}
