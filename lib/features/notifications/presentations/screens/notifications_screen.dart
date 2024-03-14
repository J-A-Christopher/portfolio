import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/features/notifications/presentations/bloc/image_repo_bloc.dart';
import 'package:portfolio/features/whatsnew/presentation/bloc/whats_new_bloc.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ImageRepoBloc>().add(GetImage());
    context.read<WhatsNewBloc>().add(GetWhatsNew());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          BlocListener<ImageRepoBloc, ImageRepoState>(
            listener: (context, state) {
              if (state is ImageRepoError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: BlocBuilder<ImageRepoBloc, ImageRepoState>(
                builder: (context, state) {
              if (state is ImageRepoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ImageRepoLoaded) {
                final imgData = state.imgData.imageUrl;
                final mediaQuery = MediaQuery.of(context).size;
                return ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.elliptical(300, 60)),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: '$imgData',
                          fit: BoxFit.cover,
                          height: mediaQuery.height * 0.4,
                          width: double.infinity,
                          colorBlendMode: BlendMode.darken,
                          color: Colors.black.withOpacity(.5),
                        ),
                        Positioned(
                            top: 250,
                            left: 95,
                            child: Column(
                              children: [
                                Text(
                                  'Cj',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Text(
                                  'Developer  \u2022 Engineer  \u2022 Designer',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 17),
                                )
                              ],
                            ))
                      ],
                    ));
              }

              return const SizedBox();
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'What\'s new:',
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
          ),
          BlocListener<WhatsNewBloc, WhatsNewState>(
            listener: (context, state) {
              if (state is WhatsNewError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: BlocBuilder<WhatsNewBloc, WhatsNewState>(
                builder: (context, state) {
              if (state is WhatsNewLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WhatsNewLoaded) {
                final stateObject = state.whatsNewEntity;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final dateObject = stateObject[index].updatedAt;
                    final convertedDate = DateTime.parse(dateObject ?? '');
                    String formattedDate =
                        DateFormat.yMMMEd().format(convertedDate);
                    final valueString = stateObject[index].projectDescription;
                    List<String> values = valueString!.split(",");
                    List<String> numberValues = values.asMap().entries.map(
                      (entry) {
                        int index = entry.key + 1;
                        String value = entry.value;
                        return "$index. $value";
                      },
                    ).toList();
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${stateObject[index].projectTitle}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                            ),
                            Text('${stateObject[index].projectSubTitle}'),
                            ...numberValues.map((text) {
                              return Text(text);
                            }),
                            Row(
                              children: [
                                Text(
                                  'Updated on : $formattedDate',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(fontStyle: FontStyle.italic),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: stateObject.length,
                );
              }
              return const SizedBox.shrink();
            }),
          )
        ],
      ),
    );
  }
}
