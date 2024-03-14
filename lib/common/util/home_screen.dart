import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:portfolio/common/components/grid_component.dart';
import 'package:portfolio/common/components/social_media_component.dart';
import 'package:portfolio/common/components/text_component.dart';
import 'package:portfolio/common/util/colors.dart';
import 'package:portfolio/features/imageCarousel/presentation/bloc/carousel_images_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/features/welcomeCard/presentation/widgets/welcome_card.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';

///[HomeScreen] class
class HomeScreen extends StatefulWidget {
  ///The constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launchTwitter(BuildContext context) async {
    final theme = Theme.of(context);
    final url =
        Uri.parse('https://x.com/Cj_jesse_?t=lWI_KfIcOC6Zwa_xiANPSQ&s=09');

    try {
      await launchUrl(
        url,
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Could not launch X')));
      }
    }
  }

  Future<void> _launchLinkedIn(BuildContext context) async {
    final theme = Theme.of(context);
    final url = Uri.parse(
        'https://www.linkedin.com/in/christopher-jesse?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app');

    try {
      await launchUrl(
        url,
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch LinkedIn')));
      }
    }
  }

  Future<void> _launchInstagram(BuildContext context) async {
    final theme = Theme.of(context);
    final url = Uri.parse('https://www.instagram.com/chief_sensei/');

    try {
      await launchUrl(
        url,
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // If the URL launch fails, an exception will be thrown. (For example, if no browser app is installed on the Android device.)
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch Instagram')));
      }
    }
  }

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
        child: ListView(
          children: [
            BlocListener<CarouselImagesBloc, CarouselImagesState>(
              listener: (context, state) {
                if (state is CarouselImagesError) {
                  final errorMessage = state.errorMessage;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      errorMessage,
                    ),
                  ));
                }
              },
              child: BlocBuilder<CarouselImagesBloc, CarouselImagesState>(
                  builder: (context, state) {
                if (state is CarouselImagesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CarouselImagesLoaded) {
                  final fourElements = state.imageObject.sublist(0, 6);
                  final mediaQuery = MediaQuery.of(context).size;

                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
              }),
            ),
            const SizedBox(
              height: 7,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 7, right: 7),
                child: WelcomeCard()),
            const GridComponent(),
            const TextComponent(
              text: 'Connect with me',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaComponent(
                    color: AppColors.xblack,
                    icon: const FaIcon(
                      FontAwesomeIcons.x,
                      color: Colors.white,
                    ),
                    func: () {
                      _launchTwitter(context);
                    },
                  ),
                  SocialMediaComponent(
                    color: AppColors.linkedin,
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      color: Colors.white,
                    ),
                    func: () {
                      _launchLinkedIn(context);
                    },
                  ),
                  SocialMediaComponent(
                    color: AppColors.instagram,
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    func: () {
                      _launchInstagram(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
