import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

///[HomeScreen] class
class HomeScreen extends StatefulWidget {
  ///The constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<CarouselImagesBloc>().add(const GetCarouselImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<CarouselImagesBloc, CarouselImagesState>(
                builder: (context, state) {
              if (state is CarouselImagesLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CarouselImagesLoaded) {
                final fourElements = state.imageObject.sublist(0, 6);
                final mediaQuery = MediaQuery.of(context).size;

                return Column(
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: fourElements.length,
                          itemBuilder: (context, index, realIndex) {
                            final urlImage = fourElements[index].imgUrl;
                            final description =
                                fourElements[index].imgDescription;

                            return buildImage(urlImage, index, description);
                            //Text(description!)
                          },
                          options: CarouselOptions(
                              height: mediaQuery.height * 0.4,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              }),
                        ),
                        Positioned(
                            left: 180,
                            bottom: 5,
                            child: buildIndicator(fourElements.length))
                      ],
                    ),
                  ],
                );
              }

              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }

  Widget buildImage(String? urlImage, int index, String? description) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            color: Colors.grey[200],
            child: CachedNetworkImage(
              imageUrl: '$urlImage',
              fit: BoxFit.cover,
              width: double.infinity,
              height: mediaQuery.height * 0.4,
              placeholder: (context, url) => Center(
                  child: Text(
                'Loading..',
                style:
                    GoogleFonts.lato(textStyle: const TextStyle(fontSize: 30)),
              )),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/server.png'),
            )),
        Positioned(
          bottom: 25,
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
              child: Text(
                description!,
                style: GoogleFonts.patrickHand(
                    textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.white)),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIndicator(int length) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: length,
      effect: const JumpingDotEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Colors.white,
      ),
    );
  }
}
