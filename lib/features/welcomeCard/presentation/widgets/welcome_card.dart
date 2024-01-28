import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/util/colors.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';
import 'package:portfolio/features/welcomeCard/presentation/bloc/bio_card_bloc.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  @override
  void initState() {
    super.initState();
    context.read<BioCardBloc>().add(RetrieveBioCardData());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<BioCardBloc, BioCardState>(builder: (context, state) {
          if (state is BioCardLoading) {
            return const CircularProgressIndicator();
          }
          if (state is BioCardLoaded) {
            final bio = state.aboutData.first.bio;
            final aboutDataCheck = state.aboutData.isEmpty;
            final tourDataBloc = context.read<CarouselImagesBloc>().state;
            String? imageUrl;
            if (tourDataBloc is CarouselImagesLoaded) {
              imageUrl = tourDataBloc.imageObject.first.imgUrl;
            }

            return Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            aboutDataCheck
                                ? 'Hi.. am Cj, an Android developer. I will create you an app like this from as little as \$100 in a week\'s time.'
                                : '$bio',
                            style: GoogleFonts.quicksand(
                                fontSize: 12,
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              child: aboutDataCheck
                                  ? Image.asset(
                                      'assets/Now.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: imageUrl ?? '',
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        'assets/Now.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        })
      ],
    );
  }
}
