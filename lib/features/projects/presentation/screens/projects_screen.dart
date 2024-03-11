import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:portfolio/features/projects/presentation/bloc/projects_bloc.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectsBloc>().add(GetProjects());
  }

  Future<void> _launchGivenProject(
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
        title: const Text('Sample Projects'),
      ),
      body: BlocBuilder<ProjectsBloc, ProjectsState>(builder: (context, state) {
        if (state is ProjectsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProjectsLoaded) {
          final projObject = state.projData;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _launchGivenProject(
                        context, projObject[index].projUrl ?? '');
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    '${projObject[index].projectName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    '${projObject[index].description}',
                                    maxLines: 3,
                                  ),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: Theme.of(context).colorScheme.error,
                                size: 20,
                              ),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              imageUrl: '${projObject[index].imageUrl}',
                              height: 100,
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: projObject.length,
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
