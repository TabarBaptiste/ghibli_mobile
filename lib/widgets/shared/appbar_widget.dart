import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/logo.webp', height: 30),
      centerTitle: true,
      // backgroundColor: Color.fromRGBO(1, 117, 194, 1),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
