import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;
  const TextLink({
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: color,
        ),
      ),
    );
  }
}
