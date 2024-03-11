import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:portfolio/features/blogs/presentation/bloc/blogs_bloc.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogsBloc>().add(GetBlogs());
  }

  Future<void> _launchGivenBlog(
      BuildContext context, String launcherUrl) async {
    final theme = Theme.of(context);
    final url = Uri.parse(launcherUrl);

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
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Could not launch blog post. Try again later')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Blogs',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<BlogsBloc, BlogsState>(builder: (context, state) {
            if (state is BlogsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BlogsLoaded) {
              final blogObject = state.blogEntity;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _launchGivenBlog(
                          context, blogObject[index].blogUrl ?? '');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        child: ListTile(
                            leading: const Icon(
                              Icons.book,
                              size: 30,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${blogObject[index].title}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('${blogObject[index].blogDescription}'),
                              ],
                            )),
                      ),
                    ),
                  );
                },
                itemCount: blogObject.length,
              );
            }
            return const SizedBox.shrink();
          }),
        ));
  }
}
