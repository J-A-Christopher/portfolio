import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridComponent extends StatelessWidget {
  const GridComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gridImageName = [
      'blog',
      'contact',
      'enjoy',
      'portfolio',
      'resume',
      'services'
    ];

    List<String> gridTitle = [
      'Blogs',
      'Contact',
      'Experiences',
      'Portfolio',
      'Resume',
      'Services'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: List.generate(
              gridTitle.length,
              (index) => InkWell(
                    onTap: () {
                      switch (gridTitle[index]) {
                        case 'Portfolio':
                          context.push(
                            '/portfolio-screen',
                          );
                        case 'Experiences':
                          context.push(
                            '/experiences',
                          );
                        case 'Contact':
                          context.push('/contact', extra: gridImageName[0]);
                        case 'Blogs':
                          context.push('/blog-screen');

                        case 'Resume':
                          context.push('/resume-screen');

                        case 'Services':
                          context.push('/services');
                      }
                    },
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/${gridImageName[index]}.png',
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                gridTitle[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
