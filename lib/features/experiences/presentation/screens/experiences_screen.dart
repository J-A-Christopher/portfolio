import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  void initState() {
    super.initState();
    context.read<CarouselImagesBloc>().add(const GetCarouselImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Experiences'),
        centerTitle: true,
      ),
      body: BlocBuilder<CarouselImagesBloc, CarouselImagesState>(
          builder: (context, state) {
        if (state is CarouselImagesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CarouselImagesLoaded) {
          final carouselObject = state.imageObject;
          return ListView.builder(
              itemCount: carouselObject.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.push('/experiences/image-detail', extra: carouselObject[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(carouselObject[index].imgUrl ?? ''),
                  ),
                );
              });
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
