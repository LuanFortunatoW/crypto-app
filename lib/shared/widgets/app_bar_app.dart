import 'package:flutter/material.dart';

import 'button_change_visibility.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarApp({
    Key? key,
    required this.visibility,
    required this.title,
  }) : super(// coverage:ignore-line
          key: key,
        );

  final bool visibility;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: visibility
          ? [
              const Padding(
                padding: EdgeInsets.only(right: 18),
                child: ButtonChangeVisibility(),
              )
            ]
          : [],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
