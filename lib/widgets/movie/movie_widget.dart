import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  final String? id;
  const MovieWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Text(id!);
  }
}