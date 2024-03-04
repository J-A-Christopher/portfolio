import 'package:cached_network_image/cached_network_image.dart';
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
          final mediaQuery = MediaQuery.of(context).size;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: carouselObject.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push('/experiences/image-detail',
                          extra: carouselObject[index]);
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: carouselObject[index].imgUrl ?? '',
                              placeholder: (context, url) {
                                return const Center(
                                    child: Text(
                                  'Loading..',
                                  style: TextStyle(fontSize: 25),
                                ));
                              },
                              errorWidget: (context, url, error) {
                                return Center(
                                    child: Text(
                                  'Error Loading image',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ));
                              },
                              height: 350,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,

                          child: Container(
                            width: mediaQuery.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.black.withOpacity(0),
                                  ],
                                ),
                                border: const Border(bottom: BorderSide.none)),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    '${carouselObject[index].imgDescription}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
