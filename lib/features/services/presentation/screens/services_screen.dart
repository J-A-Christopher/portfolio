import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/services/presentation/bloc/services_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServicesBloc>().add(GetService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<ServicesBloc, ServicesState>(
            listener: (context, state) {
              if (state is ServiceError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: BlocBuilder<ServicesBloc, ServicesState>(
                builder: (context, state) {
              if (state is ServicesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ServicesLoaded) {
                final serviceObject = state.servicesData;
                final mediaQuery = MediaQuery.of(context).size;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                                height: 250,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                imageUrl:
                                    '${serviceObject[index].serviceImageUrl}'),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  width: mediaQuery.width,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text(
                                          '${serviceObject[index].serviceTitle}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text(
                                          '${serviceObject[index].serviceDescription}'),
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            context.push('/services/contact');
                                          },
                                          icon: const Icon(Icons.check_box),
                                          label: const Text('BOOK NOW'))
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: serviceObject.length,
                );
              }
              return const SizedBox.shrink();
            }),
          ),
        ));
  }
}
