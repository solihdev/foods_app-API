import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String word;
  const TextWidget({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Text(
        word,
      ),
    );
  }
}