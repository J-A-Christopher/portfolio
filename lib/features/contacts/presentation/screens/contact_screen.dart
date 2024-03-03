import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Me'),
          centerTitle: true,
        ),
        body:  Center(
          child: Text(description),
        ));
  }
}
