// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ghibli/widgets/movie/movie_widget.dart';
import 'package:ghibli/widgets/shared/appbar_widget.dart';

class MovieScreen extends StatelessWidget {
  final String? id;
  const MovieScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // inspect(id);
    return Scaffold(
      appBar: AppbarWidget(),
      body: SingleChildScrollView(child: MovieWidget(id: id,)),
    );
  }
}
