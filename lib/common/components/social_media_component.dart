import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaComponent extends StatelessWidget {
  final FaIcon icon;
  final Color color;
  final Function func;

  const SocialMediaComponent(
      {super.key, required this.icon, required this.color, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: icon,
      ),
    );
  }
}
