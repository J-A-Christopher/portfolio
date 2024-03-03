import 'package:flutter/material.dart';

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
                      print(gridTitle[index]);
                      switch (gridTitle[index]) {
                        case 'Portfolio':
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Portfolio page loading..')));
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
