import 'package:flutter/material.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.image});
  final CarouselImageEntity image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${image.imgDescription}'),
      ),
    );
  }
}
