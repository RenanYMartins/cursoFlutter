import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  const AdaptativeButton(
      {super.key, required this.label, required this.onPressed});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: onPressed,
            child: Text(label, style: const TextStyle(color: Colors.white),
          ),
          );
  }
}
