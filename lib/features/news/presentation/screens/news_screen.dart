import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:portfolio/features/news/presentation/bloc/news_server_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsServerBloc>().add(GetNewsData());
  }

  Future<void> _readMore(BuildContext context, String? newsUrl) async {
    final theme = Theme.of(context);
    final url = Uri.parse('$newsUrl');

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
            const SnackBar(content: Text('Could not launch web page')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsServerBloc, NewsServerState>(
          builder: (context, state) {
        if (state is NewsServerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsServerLoaded) {
          final newsObject = state.newsData;
          final mediaQuery = MediaQuery.of(context).size;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Card(
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        CachedNetworkImage(
                            height: 300,
                            placeholder: (context, url) => Image.asset(
                                  'assets/placeholder.png',
                                  fit: BoxFit.cover,
                                ),
                            errorWidget: (context, url, error) => Image.asset(
                                  'assets/placeholder.png',
                                  fit: BoxFit.cover,
                                ),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            imageUrl: '${newsObject[index].urlToImage}'),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Theme.of(context).colorScheme.secondary,
                              width: mediaQuery.width,
                              height: 160,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Column(
                                  children: [
                                    AutoSizeText('${newsObject[index].title}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AutoSizeText(
                                      newsObject[index].description ?? '',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          _readMore(
                                              context, newsObject[index].url);
                                        },
                                        icon: const Icon(Icons.remove_red_eye),
                                        label: const Text('READ MORE'))
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: newsObject.length,
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}

