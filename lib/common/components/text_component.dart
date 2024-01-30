import 'package:flutter/material.dart';
import 'package:portfolio/common/util/colors.dart';

class TextComponent extends StatelessWidget {
  final String text;
  const TextComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.fontColor),
      ),
    );
  }
}
