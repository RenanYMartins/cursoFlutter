import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
  );
}
